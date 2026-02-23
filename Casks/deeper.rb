cask "deeper" do
  version "0.1.1"
  sha256 "ea044763233edd08c0266cf811755265cd4d6e44a7c897e53786aed927e3fc2b"

  url "https://github.com/f/deeper/releases/download/v0.1.1/Deeper.dmg"
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
