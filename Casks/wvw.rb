cask "wvw" do
  version "0.2.0"

  on_arm do
    sha256 "3d25ba72fab32f493b779369c352547a2a27f5be6f49fe5884305a2a1ec805ef"
    url "https://github.com/f/wvw.dev-app/releases/download/v0.2.0/WVW_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "b2ef4a1aab8affbac9eafd248eb2b1c6b8ebe00e6999c25bb45caf7e160a847f"
    url "https://github.com/f/wvw.dev-app/releases/download/v0.2.0/WVW_#{version}_x64.dmg"
  end

  name "WVW"
  desc "World Vibe Web — the distributed app store for vibe-coded projects"
  homepage "https://wvw.dev"

  depends_on macos: ">= :catalina"

  app "WVW.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/WVW.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.wvw.desktop.plist",
    "~/Library/Saved Application State/dev.wvw.desktop.savedState",
    "~/Library/WebKit/dev.wvw.desktop",
  ]
end
