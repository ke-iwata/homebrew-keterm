cask "kterm" do
  arch arm: "arm64"

  version "0.0.1"
  sha256 "845d3c61043bcf37cbd1ea0164e4c60a107b2828358a32d274967f39327469d3"

  url "https://github.com/ke-iwata/terminal/releases/download/v#{version}/kterm-#{version}-macos-#{arch}.zip"
  name "kterm"
  desc "Terminal emulator written from scratch in Rust"
  homepage "https://github.com/ke-iwata/terminal"

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "kterm.app"

  zap trash: "~/.terminal.config.toml"

  # Unsigned/ad-hoc-signed build (no Apple Developer ID yet) -- first
  # launch is blocked by Gatekeeper's "unidentified developer" dialog.
  # Clearing the quarantine flag is the same thing `brew install --cask`
  # would otherwise need `--no-quarantine` for; doing it as a caveat
  # keeps the default (safer) quarantine behavior for everyone else who
  # doesn't run this specific app.
  caveats <<~EOS
    kterm is not notarized by Apple, so Gatekeeper will refuse to open it
    on first launch ("kterm.app is damaged and can't be opened" or
    similar). Either:

      Right-click kterm.app in Finder -> Open -> Open (in the dialog)

    or clear the quarantine flag yourself:

      xattr -dr com.apple.quarantine "#{appdir}/kterm.app"
  EOS
end
