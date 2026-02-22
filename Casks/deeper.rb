cask "deeper" do
  version "0.1.0"
  sha256 "99044c6cb30dbe4dc65fed0cb43a7ffc309df74e1d5e92204f0ef6f45b177476"

  url "https://github.com/f/deeper/releases/download/v0.1.0/Deeper.dmg"
  name "Deeper"
  desc "macOS messaging analytics app for Beeper — visualize your conversations across platforms"
  homepage "https://github.com/f/deeper"

  depends_on macos: ">= :tahoe"

  app "Deeper.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Deeper.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.fka.Deeper.plist",
    "~/Library/Saved Application State/dev.fka.Deeper.savedState",
  ]
end
