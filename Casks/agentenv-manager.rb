cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.7"
  sha256 arm:   "90e733170d2e2099fc2ecd66abe63bcc0278a38217e62e27d7b74f14503d6ef9",
         intel: "deb61d10aaf57ab1840ba132cb6213a479de042d795e109c756272156e8b2786"

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
