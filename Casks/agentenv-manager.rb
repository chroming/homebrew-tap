cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.2.4"
  sha256 arm:   "490b4fc3584a123a676b44b03fdf33e7437e3439e9a8cf5446536ee840a3138c",
         intel: "b4d6e64dfef4f681d98df6f9ede318397f846d39336e891341d3a3955479994e"

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
