cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "2e52793c6cbff5932355f21cf15d2279e04f8b71245696616a1019d1b867ad06",
         intel: "0229dc0850ca602b2c361b3d536066bb770819718bf01db6619b6bed0a875f90"

  url "https://github.com/chroming/agentenv-manager/releases/download/v#{version}/AgentEnv-Manager-#{version}-mac-#{arch}-homebrew.dmg"
  name "AgentEnv Manager"
  desc "Manage reusable local AI Agent environments"
  homepage "https://github.com/chroming/agentenv-manager"

  depends_on macos: :monterey

  app "AgentEnv Manager.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/AgentEnv Manager.app"]
  end
end
