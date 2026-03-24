cask "poke-gate" do
  version "0.1.0"
  sha256 "497f134c01f902d6c4e5ce7fc596f33bcb2c262e5ecc205c3d0fc289d8824e02"

  url "https://github.com/f/poke-gate/releases/download/v0.1.0/Poke.macOS.Gate.dmg"
  name "Poke Gate"
  desc "macOS menu bar app to expose your machine to your Poke AI assistant"
  homepage "https://github.com/f/poke-gate"

  depends_on macos: ">= :sequoia"

  app "Poke macOS Gate.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Poke macOS Gate.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.fka.Poke-macOS-Gate.plist",
    "~/Library/Saved Application State/dev.fka.Poke-macOS-Gate.savedState",
    "~/.config/poke-gate",
  ]
end
