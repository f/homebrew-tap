cask "fastbar" do
  version "1.0.0"
  sha256 "16bac69970903fa572c21aaac4a9be4893f71531140dd5879148c7ba0981cdb4"

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
