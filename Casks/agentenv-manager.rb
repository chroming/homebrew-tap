cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.6"
  sha256 arm:   "dd482e2c9eef991b569b8604c6d6f710ce11d69e6ed4d920775fb5a8d1e7ce17",
         intel: "cbcca5c6451a5aae8bf59a4a06ca4b6e79c6cee25d4cba047ef508e67a48be7d"

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
