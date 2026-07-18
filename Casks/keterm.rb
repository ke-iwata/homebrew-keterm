cask "keterm" do
  arch arm: "arm64"

  version "0.0.1"
  sha256 "956182259080d7c49ecc79f50f1959c38d2e8b70d8154a2cced106e6780a931f"

  url "https://github.com/ke-iwata/terminal/releases/download/v#{version}/keterm-#{version}-macos-#{arch}.zip"
  name "keterm"
  desc "Terminal emulator written from scratch in Rust"
  homepage "https://github.com/ke-iwata/terminal"

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "keterm.app"

  zap trash: "~/.terminal.config.toml"

  # Unsigned/ad-hoc-signed build (no Apple Developer ID yet) -- first
  # launch is blocked by Gatekeeper's "unidentified developer" dialog.
  # Clearing the quarantine flag is the same thing `brew install --cask`
  # would otherwise need `--no-quarantine` for; doing it as a caveat
  # keeps the default (safer) quarantine behavior for everyone else who
  # doesn't run this specific app.
  caveats <<~EOS
    keterm is not notarized by Apple, so Gatekeeper will refuse to open it
    on first launch ("keterm.app is damaged and can't be opened" or
    similar). Either:

      Right-click keterm.app in Finder -> Open -> Open (in the dialog)

    or clear the quarantine flag yourself:

      xattr -dr com.apple.quarantine "#{appdir}/keterm.app"
  EOS
end
