cask "deeper" do
  version "0.1.2"
  sha256 "ed3f4c56e29d2d3d6d09b4199c2f04802cf25a7b6922d2ce95cb78537ca03f8a"

  url "https://github.com/f/deeper/releases/download/v0.1.2/Deeper.dmg"
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
