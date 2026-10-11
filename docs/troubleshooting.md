# Troubleshooting

## Search finds fewer files than expected

Open Settings › Search. If the index is still building, wait; if it is off, turn it on. Without the index
Branchway falls back to Spotlight, which leaves out many folders.

## A folder says "Operation not permitted"

macOS protects some locations. Grant Branchway access when it prompts, or add it under System Settings ›
Privacy & Security › Full Disk Access, then relaunch Branchway.

## A vault will not delete or move

If **Protect vaults from other apps** is on, Branchway asks for an administrator password. If the helper
is gone, see [vaults](vaults.md) for the manual `chflags` command.

## Photo search finds nothing

Check that image indexing is on in Settings › Search and that indexing has finished. Search words outside
Vision's vocabulary, such as colours, match only with the optional model, which is not available yet; see
[model](model.md).

## The app will not open after an update

Download the previous disk image from Releases and replace the app in Applications, then open an issue
with your macOS version and what happened.
