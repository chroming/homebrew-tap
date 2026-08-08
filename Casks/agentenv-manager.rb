cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "3a616c6703b3be294346700adb7971e4df69815684b37bcb3161ef8de5ca5fb0",
         intel: "c932704c64668aeb8186f438a1d2b4cb70a1cac0eb891a89eef3d885975d1e0d"

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
