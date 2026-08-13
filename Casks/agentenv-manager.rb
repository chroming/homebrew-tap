cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.8"
  sha256 arm:   "1ae790b332cf8a947352282a757995409d5d05c9e8cad5af9d59ea36f0c8b8fc",
         intel: "cd7c55996f50946b02264ae7388b24f9d4e55831ad923f37fa290b0890d0ccf5"

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
