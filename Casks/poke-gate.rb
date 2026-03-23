cask "poke-gate" do
  version "0.0.4"
  sha256 "6a0eca60c1fc1bc66f2a1e65005fef96a3d5e8c1ebd9b211854463ee4801a768"

  url "https://github.com/f/poke-gate/releases/download/v0.0.4/Poke%20macOS%20Gate.dmg"
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
