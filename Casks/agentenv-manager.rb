cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.10"
  sha256 arm:   "a7e37cc6d94453b36fd44f52be9506b689dc7591e4c0454523ed5a76b1e1eb2d",
         intel: "c0e613daf7201239ec4961f513d621ad9ad56e25e3176f8c011c7c89d13537ec"

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
