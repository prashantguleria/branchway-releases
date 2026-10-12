# Models

`index.json` lists the optional search models that can be downloaded into Branchway. It is the update channel for models.

> **Status: first model published.** `embeddinggemma-2` build 1 is released as `model-embeddinggemma-2-1`
> and the app downloads it from Settings › Search. The app has the release addresses and the public key
> built in; it does not read this index yet, so a newer model needs an app update that points at it.
> While this repository is private the download answers "Not available right now".

## Entry fields

| Field | Meaning |
|---|---|
| `id`, `version` | Which model, and which build of it |
| `dimensions` | Embedding size |
| `archiveBytes`, `archiveSHA256` | Size and SHA-256 of the zip, checked before it is unpacked |
| `minAppBuild` | Oldest Branchway build that can use it (owner sets this) |
| `releaseTag` | `model-<id>-<version>` |
| `manifestURL`, `archiveURL` | Release assets |
| `signature` | Ed25519 signature (base64) of the exact bytes of `manifest.json` |
| `notes` | Short text for the user |

`manifest.json` follows the app's manifest format 1: `modelID`, `modelVersion`, `dimensions`, and `files`,
each file with a safe relative `path`, `size` and lowercase hex `sha256`.

## Delivering a new model version

1. Build the model folder and its zip.
2. Run `scripts/publish-model.sh` to write `manifest.json` and print the index entry.
3. Sign `manifest.json` with the model key (outside this repository) and put the signature in the entry.
4. Create a release tagged `model-<id>-<version>` and upload the zip and `manifest.json`.
5. Add the entry to `index.json` and commit.

## What the user sees

When a newer version than the installed one exists for their app build, Settings › Search shows "A newer
model is available" with its size. Then:

- The download happens only when the user clicks. Nothing is silent.
- Branchway verifies the signature and hashes, then re-indexes in the background while the old model keeps
  answering searches, and switches over only when the new index is complete.
- Older versions stay downloadable.
