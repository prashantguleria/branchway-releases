#!/usr/bin/env bash
# Build manifest.json for a model folder and print the models/index.json entry.
#
# Usage: scripts/publish-model.sh <model-folder> <model-id> <version> <dimensions> <archive.zip>
#
# <model-folder> holds the files that end up on the Mac. <archive.zip> is the zip of that folder that you
# upload as a release asset. The manifest is written to <model-folder>/../manifest.json. Signing the
# manifest (Ed25519) and uploading are manual steps; this script does neither.
set -euo pipefail

if [ "$#" -ne 5 ]; then
  echo "usage: $0 <model-folder> <model-id> <version> <dimensions> <archive.zip>" >&2
  exit 64
fi

folder="$1"; id="$2"; version="$3"; dims="$4"; archive="$5"
[ -d "$folder" ] || { echo "no such folder: $folder" >&2; exit 66; }
[ -f "$archive" ] || { echo "no such file: $archive" >&2; exit 66; }

out="$(cd "$folder/.." && pwd)/manifest.json"

python3 - "$folder" "$id" "$version" "$dims" "$out" <<'PY'
import hashlib, json, os, sys
folder, model_id, version, dims, out = sys.argv[1:6]
files = []
for root, _, names in os.walk(folder):
    for n in sorted(names):
        full = os.path.join(root, n)
        rel = os.path.relpath(full, folder)
        h = hashlib.sha256()
        with open(full, "rb") as f:
            for chunk in iter(lambda: f.read(1 << 20), b""):
                h.update(chunk)
        files.append({"path": rel, "size": os.path.getsize(full), "sha256": h.hexdigest()})
files.sort(key=lambda e: e["path"])
manifest = {"format": 1, "modelID": model_id, "modelVersion": version,
            "dimensions": int(dims), "files": files}
with open(out, "w") as f:
    json.dump(manifest, f, indent=2, sort_keys=True)
    f.write("\n")
print("wrote", out)
PY

archive_sha="$(shasum -a 256 "$archive" | awk '{print $1}')"
archive_size="$(stat -f%z "$archive")"
tag="model-${id}-${version}"
base="https://github.com/prashantguleria/branchway-releases/releases/download/${tag}"

echo
echo "Add this entry to models/index.json (fill in minAppBuild and signature):"
cat <<ENTRY
    {
      "id": "${id}",
      "version": "${version}",
      "dimensions": ${dims},
      "archiveBytes": ${archive_size},
      "archiveSHA256": "${archive_sha}",
      "minAppBuild": 0,
      "releaseTag": "${tag}",
      "manifestURL": "${base}/manifest.json",
      "archiveURL": "${base}/$(basename "$archive")",
      "signature": "BASE64_ED25519_SIGNATURE_OF_manifest.json",
      "notes": ""
    }
ENTRY
