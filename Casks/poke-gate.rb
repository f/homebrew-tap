cask "poke-gate" do
  version "0.1.4"
  sha256 "b0696cb0ccf30c2f79076babc7be0a990494f4ac4335ec10a784bf39cbcd1ab3"

  url "https://github.com/f/poke-gate/releases/download/v0.1.4/Poke.macOS.Gate.dmg"
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
