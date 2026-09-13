cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.24"
  sha256 arm:   "43147a150ed4039c3bccd08fdce4567fb896b05a529eb8bd191ce92d5404f845",
         intel: "f90361accdcbc9d60e496ca7436b6c71d9ab18bbe8c5a59e96b2319c7add4bc2"

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
