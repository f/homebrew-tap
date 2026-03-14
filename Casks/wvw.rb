cask "wvw" do
  version "0.1.0"

  on_arm do
    sha256 "02f0e4a2d7c3bf9729e21f61203aa7c5516d26483524253ec3c7b7439616f663"
    url "https://github.com/f/wvw.dev-app/releases/download/v0.1.0/WVW_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "e42d921093c7f80f26003b7c1628a74795579e7f257720fe19282c736c7a7fb1"
    url "https://github.com/f/wvw.dev-app/releases/download/v0.1.0/WVW_#{version}_x64.dmg"
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
