cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.5"
  sha256 arm:   "5a495935291abeaa274847aaedda1befbdf52e68f6c5319e7507a639f8a0f8a4",
         intel: "ba8f81f637986539fbecc66f34c1bb61a2ca5f73fd210425484d40b6211a5956"

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
