cask "fastbar" do
  version "1.0.1"
  sha256 "b08238313e40110cbda9a5fe6dee3e360ae7c39acc9f2f4d0bed2b2fa99b57f2"

  url "https://github.com/f/fastbar/releases/download/v#{version}/FastBar.dmg"
  name "FastBar"
  desc "Fast.com download speed and history in the menu bar"
  homepage "https://github.com/f/fastbar"

  depends_on macos: :sonoma

  app "FastBar.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/FastBar.app"]
  end

  zap trash: [
    "~/Library/Containers/dev.fka.fastbar",
    "~/Library/Preferences/dev.fka.fastbar.plist",
    "~/Library/Saved Application State/dev.fka.fastbar.savedState",
    "~/Library/WebKit/dev.fka.fastbar",
  ]
end
