cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.16"
  sha256 arm:   "1eb692e4e4b9bbf214470e610cadf0b143bcc8bcf91e669bec8a6752e3569f08",
         intel: "31902d1f159edc907a86ac3c5df5e4d05390e7a2254a9f53edc8522d19953cbe"

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
