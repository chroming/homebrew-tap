cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "21c85c3996cce982942b8efcf2144deafa154f3a73de46737115c91c8267cb45",
         intel: "55cf02e940f7bf99b665803ccdb0737291f5df023970a66610ba2dac4a97986a"

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
