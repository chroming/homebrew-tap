cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "a6f9efd075814d50d9f51932046f7c0e50a86d695e126110b15cfe3e1ed9839d",
         intel: "d3f561d2171311903a4a1d6ef1dc39ad8806a53e8837c53ecfb544dec1188029"

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
