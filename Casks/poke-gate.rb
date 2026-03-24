cask "poke-gate" do
  version "0.0.9"
  sha256 "afa5f29c6d65ef1bbb23961fe8a1038da6d86f1d9cd7600c6ca217a6e1c7f11e"

  url "https://github.com/f/poke-gate/releases/download/v0.0.9/Poke.macOS.Gate.dmg"
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
