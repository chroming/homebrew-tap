cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.4"
  sha256 arm:   "f94fc14defd6e4e87a7a7bf99d11dc9b8e7ad3b24524ad3a8104c53c332d96d8",
         intel: "806226e84f212ac03e2c74f6da0a163aae921cf32c1ba838d92111a9dde66541"

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
