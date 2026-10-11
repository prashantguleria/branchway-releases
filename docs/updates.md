# Updates

Branchway checks for updates with Sparkle, the update framework many Mac apps use.

- The application menu has a **Check for Updates** command.
- Updates are signed. Sparkle checks an EdDSA signature against a public key built into the app before
  installing, and the download is a notarized disk image.
- Updates are not installed automatically by default.
- The appcast (the list Sparkle reads) is at `https://evenpine.com/branchway/appcast.xml`. The source of
  that file lives in this repository under `appcast/`.
- Release notes are in [CHANGELOG.md](../CHANGELOG.md).

To go back to an earlier version, download that version's disk image from the Releases page.
