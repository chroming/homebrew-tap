cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.20"
  sha256 arm:   "700bb751040410c48f824a6b070eeb933a04979b1a81cb725d16b6a9d61f785a",
         intel: "bbcc4fd8c636b171989e60a100050ab4fc627e7d020b7a943482aba418dc2f14"

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
