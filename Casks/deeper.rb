cask "deeper" do
  version "0.0.1"
  sha256 "8c4fb63bfea38de4be50f2a15f85a57bf7744d8267febd36c8aecd2be1921762"

  url "https://github.com/f/deeper/releases/download/v0.0.1/Deeper.dmg"
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
