# The optional search model

Branchway's photo search works without any download, using Apple's Vision framework. An optional model,
**EmbeddingGemma 2**, adds meaning-based matching so a query like "dog on a beach" finds pictures that lack
those exact labels.

The model is optional, off by default and runs entirely on your Mac. Nothing you search for, and none of
your images, leaves it.

## Requirements

Apple silicon and macOS 15 or later.

## Status

EmbeddingGemma 2, build 1 is published as the release `model-embeddinggemma-2-1` (662 MB download, about 894 MB
on disk). Branchway offers it under Settings › Search › Smarter photo search. While this repository is private
the download answers "Not available right now"; it works once the repository is public.

## How the download works

1. You choose Download in Settings › Search. Nothing downloads before that.
2. Branchway fetches a manifest listing every file with its size and SHA-256 hash, and a signature of the
   manifest. The app checks the Ed25519 signature against a public key built into it.
3. It downloads the archive (a dropped connection continues from where it stopped) and checks its SHA-256
   against the one built into the app, then checks every file against the signed manifest.
4. It compiles the Core ML package on your Mac and writes an install record.
5. On every load it checks the files' hashes again. A mismatch means the model is not used.

## Where it lives

By default in `~/Library/Application Support/Branchway/Models`. A different folder, for example on an
external disk, can be chosen. If that disk is not connected, the model is unavailable until it is.

## Power

Indexing with the model is meant to run only while the Mac is charging with a healthy battery level, so it
does not drain a laptop. The thresholds are not final.

## Licence

EmbeddingGemma is released under the Apache License 2.0, and the Gemma Prohibited Use Policy applies.

## Updates to the model

New model versions are published as release assets in this repository and listed in
[models/index.json](../models/index.json). See [models/README.md](../models/README.md).
