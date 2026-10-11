# Privacy

Branchway works on your files on your Mac. It has no account, no sign-in and no third-party advertising
SDKs.

## What stays on your Mac

File names and metadata in the search index, image labels and embeddings, tags, favourites, the history
behind Home, saved commands, and settings. The search index can be turned off in Settings › Search. Vault
contents are never indexed.

## What goes over the network

| What | When | To |
|---|---|---|
| Update check | When Sparkle checks | `evenpine.com` (appcast) |
| Licence activation | When you enter a key | Evenpine's licence provider |
| Model download | Only if you choose it | Where the model manifest points |

Licence activation sends the licence key and a one-way hash that identifies your Mac. It does not send file
names or contents.

## Diagnostics

Branchway can write a diagnostics report on your Mac when something goes wrong. It stays there until you
choose to send it. Sending is not available yet.

## Permissions

Branchway asks for access to folders as it needs them. Full Disk Access is optional and only extends what
Storage and search can read. Revoke it any time in System Settings.

To report a security problem, see [SECURITY.md](../SECURITY.md).
