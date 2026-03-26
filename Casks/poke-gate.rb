cask "poke-gate" do
  version "0.2.0"
  sha256 "8d115e1a019c2c1cfd564b13991ff04c62462b9b83f8f9d5776573b08cc0bf6f"

  url "https://github.com/f/poke-gate/releases/download/v0.2.0/Poke.macOS.Gate.dmg"
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
