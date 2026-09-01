cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.21"
  sha256 arm:   "27e62db4ee3bdd8dd8719b8e5deeba09212871116ac138c39735f193ebfc6267",
         intel: "eba49cbfc19398acf00f83d1694dddc639d2ff50a4dfb0f274cf363eeb532367"

  url "https://github.com/chroming/agentenv-manager/releases/download/v#{version}/AgentEnv-Manager-#{version}-mac-#{arch}-homebrew.dmg"
  name "AgentEnv Manager"
  desc "Manage reusable local AI Agent environments"
  homepage "https://github.com/chroming/agentenv-manager"

  depends_on macos: :monterey

  app "AgentEnv Manager.app"

  postflight do |c|
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", c.appdir/"AgentEnv Manager.app"]
  end
end
