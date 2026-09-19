cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "08111470b77b8dc12e6bcd675b06239091673589a1fac5273112838a866cd155",
         intel: "fe07d1cfa6b40fc761f34200965a262e0b860dd1d6a48b07ca33025648c552c3"

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
