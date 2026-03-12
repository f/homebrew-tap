cask "istanbul" do
  version "1.0"
  sha256 "e527c9afe36596852f57f9f0854813b3e418a3240ad200ab4a21215f44a5ba64"

  url "https://github.com/f/istanbul/releases/download/v1.0/Istanbul.dmg"
  name "Istanbul"
  desc "macOS menu bar app for ambient Istanbul soundscapes from BBC Rewind"
  homepage "https://github.com/f/istanbul"

  depends_on macos: ">= :tahoe"

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
