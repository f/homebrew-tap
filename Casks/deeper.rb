cask "deeper" do
  version "0.0.3"
  sha256 "9436b5943f5519e7f7c867c909c6ef8adf37d2878dee5c5f8dca94b74f93acfc"

  url "https://github.com/f/deeper/releases/download/v0.0.3/Deeper.dmg"
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
