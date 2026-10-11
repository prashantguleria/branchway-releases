# Vaults

A vault is an encrypted container for files you want to keep private, stored as a single `.bwvault` item.
It is an AES-256 encrypted APFS sparse bundle that Branchway creates, attaches, detaches and tracks for
you.

## Create one

Use the Vaults section in the sidebar. You choose a place, a name, a maximum size and a password. Capacity
is a maximum, not space taken up front. You must confirm that you have stored the password somewhere else.

**There is no password reset and no recovery key.** If you lose the password, the files are gone.

Vaults cannot be created inside cloud-synced folders such as iCloud Drive or OneDrive.

## Unlock

Unlock with the password. You can also allow Touch ID. Touch ID is a convenience on top of the password:
Branchway asks for the real password again after 30 days or after 10 Touch ID unlocks. "Forget Touch ID"
removes the cached credential and leaves the vault alone.

## Use

An unlocked vault appears in the sidebar and behaves like a folder. Vault contents are excluded from
Spotlight, from Branchway's search index and from Large Files. Lock it when you are done.

## Protect vaults from other apps

Settings › Privacy › Vaults › **Protect vaults from other apps** adds system flags to a locked vault so
that other apps, Terminal `rm -rf` and Finder's Trash cannot delete, rename or move it. It needs
Branchway's helper to be allowed in System Settings › General › Login Items › Allow in the Background.
Branchway asks for an administrator password when you delete, move, rename, compact or remove a protected
vault.

Turn this setting off **before uninstalling Branchway**. If the helper is gone, the flags stay. To clear
them by hand:

```sh
sudo chflags -R noschg,nosappnd,nouchg,nohidden "/path/to/Your Vault.bwvault"
```

Check a vault's flags with `ls -lOd "/path/to/Your Vault.bwvault"`: `schg,hidden` means protected.

## What a vault is not

It is not a backup. Back up the `.bwvault` item like any other file, and keep the password separately.
