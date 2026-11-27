# Dotfiles

This repository is managed with [chezmoi](https://www.chezmoi.io/), a tool for managing configuration files across machines.

# Getting started

Install chezmoi, then initialize and apply this repository:
```
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply jonwest
```

# Packages

The packages installed on each machine are listed in [`.chezmoidata/packages.yaml`](.chezmoidata/packages.yaml):

- `cli`: terminal tools, installed on CachyOS and Termux.
- `desktop`: GUI apps and services, installed on CachyOS only.

An entry is a plain name, or a map of names per OS when they differ (`{ arch: fd, termux: fd-find }`). Leave an OS out of the map to skip it there (`{ termux: termux-api }`).

To add one, use `pkgadd`. It installs the package on the current machine, adds it to the right list, then commits and pushes:

```
pkgadd --cli htop                     # CachyOS and Termux
pkgadd --desktop firefox              # CachyOS only
pkgadd --cli fd --termux fd-find      # different name on Termux
pkgadd --cli htop --arch-only         # CLI, but skip Termux
pkgadd bat                            # asks whether it belongs on Termux
```

Before installing, `pkgadd` looks the name up in the Arch/AUR and Termux repos. If one side doesn't have it, it lists similar names and lets you pick one, type another, or skip that OS. Pass `--no-check` to skip the lookup.

Other machines pick it up on their next `chezmoi update`.
