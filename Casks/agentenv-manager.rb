cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "5f6c41274106b2707012fe75746c48b65b5de4bb1f41b89e49e1add83bfd8f53",
         intel: "3a6fed5b94ea3fb56003438758e954ce652af4058fc4da3914ab5503eb5e10fa"

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
