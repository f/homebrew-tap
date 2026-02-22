cask "deeper" do
  version "0.0.1"
  sha256 "f174a65108e90c86f09820f4df5dbf202ea2b01046f3cef75e0a6ad3633f7e1f"

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
