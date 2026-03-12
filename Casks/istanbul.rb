cask "istanbul" do
  version "1.2"
  sha256 "16798a70d782225b79437defb17775ca41f80f4c29e17c80b5d9e8ec816cb2d6"

  url "https://github.com/f/istanbul/releases/download/v1.2/Istanbul.dmg"
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
