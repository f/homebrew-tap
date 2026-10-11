cask "pokemon-tcg" do
  version "0.1.0"
  sha256 "96040f849a183226f826494825b5483583e397ce5864138a928e5ce84f8e5095"

  url "https://github.com/f/pokemon-tcg/releases/download/v#{version}/Pokemon-TCG_#{version}_aarch64.dmg"
  name "Pokemon TCG"
  desc "Learn the Pokémon Trading Card Game against an AI opponent"
  homepage "https://github.com/f/pokemon-tcg"

  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "Pokemon TCG.app"

  # Ad-hoc signed, not notarized.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Pokemon TCG.app"]
  end

  zap trash: [
    "~/Library/Application Support/io.github.f.pokemon-tcg",
    "~/Library/Caches/io.github.f.pokemon-tcg",
    "~/Library/Preferences/io.github.f.pokemon-tcg.plist",
    "~/Library/Saved Application State/io.github.f.pokemon-tcg.savedState",
    "~/Library/WebKit/io.github.f.pokemon-tcg",
  ]
end
