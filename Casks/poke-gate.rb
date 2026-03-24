cask "poke-gate" do
  version "0.1.2"
  sha256 "ac24f8328c2a2b1a0ad9dab37f870915c74efdf72100159a3f771a26f4ffd787"

  url "https://github.com/f/poke-gate/releases/download/v0.1.2/Poke.macOS.Gate.dmg"
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
