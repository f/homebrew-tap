cask "deeper" do
  version "0.0.4"
  sha256 "3be36e78b1249ba87dd598741e08c46fc1a6c97c5aab09a5194d8a5dd667955b"

  url "https://github.com/f/deeper/releases/download/v0.0.4/Deeper.dmg"
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
