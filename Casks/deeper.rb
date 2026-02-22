cask "deeper" do
  version "0.0.5"
  sha256 "312d550311ccf8669ae15fde9b4e6e457e012b9bb99a533bed324b1a9e70450d"

  url "https://github.com/f/deeper/releases/download/v0.0.5/Deeper.dmg"
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
