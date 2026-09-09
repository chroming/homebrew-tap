cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.23"
  sha256 arm:   "86bf3754a7a2967960a359ec45ced5828449f6705b90d9076537748e3a479429",
         intel: "6d3a46a72079f9b76b2c6ea7e015516c6eb60629887494dfa5828bbd64537ef5"

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
