cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.12"
  sha256 arm:   "536c34b915e753d5be9ec8a9e0263731fbfa674f151ae699415e98d844d8ef69",
         intel: "1c211032393e45662638818573fb093881f48ba33d5956560278ca07dcd52e7f"

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
