# homebrew-keterm

Homebrew tap for [keterm](https://github.com/ke-iwata/terminal), a terminal
emulator for macOS written from scratch in Rust.

## Install

```sh
brew tap ke-iwata/keterm
brew install --cask keterm
```

Apple Silicon (arm64) only. The build isn't notarized by Apple yet, so
Gatekeeper will block the first launch -- see the cask's install caveats
for how to get past that (right-click -> Open, or `xattr -dr
com.apple.quarantine`).
