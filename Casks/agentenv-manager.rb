cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "a71d25fbcf0d2e1ae97e864faf8506d82a7d110e9a52bce9f54423f9c8eb3665",
         intel: "2ad5693db94a0f5472a4c8428d3ea3e9fe6f16e46edc79b0ac25fe045b04e5d3"

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
