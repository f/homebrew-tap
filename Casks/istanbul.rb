cask "istanbul" do
  version "1.1"
  sha256 "e3696a8db7abe4d58141b6d54890c818082ec4ddd3a95d504fbfefd01b014a48"

  url "https://github.com/f/istanbul/releases/download/v1.1/Istanbul.dmg"
  name "Istanbul"
  desc "macOS menu bar app for ambient Istanbul soundscapes from BBC Rewind"
  homepage "https://github.com/f/istanbul"

  depends_on macos: ">= :sonoma"

  app "Istanbul.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Istanbul.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.fka.Istanbul.plist",
    "~/Library/Saved Application State/dev.fka.Istanbul.savedState",
    "~/Library/Caches/IstanbulSounds",
  ]
end
