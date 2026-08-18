cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.15"
  sha256 arm:   "1d8aa3567c46e950d73cf88bceed1375666e6b3b8351296ca14dad833fbe1c47",
         intel: "e9c11385b2999f5b00ae490194f80b2a71ad608516579f5b64422525401b58c8"

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
