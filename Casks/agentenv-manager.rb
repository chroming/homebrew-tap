cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.11"
  sha256 arm:   "54dee110e1cc6c4112a820f7604be3156103a7422a87172843b9a4816a3cc834",
         intel: "e667e83a1c3ed82f000c892713fdc5fb60b594725a45f5d5bbbd925bd8930ade"

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
