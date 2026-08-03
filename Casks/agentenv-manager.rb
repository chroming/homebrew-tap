cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "a6c13522193ca47abfd0fc3630006371aa9b0123d317f1e975bcadc6cab81c74",
         intel: "5fd7c9c39ca7ff6c3384f66b0768e7fb9eeb3c3d93f1bc03186a6be029137268"

  url "https://github.com/chroming/agentenv-manager/releases/download/v#{version}/AgentEnv-Manager-#{version}-mac-#{arch}.dmg"
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
