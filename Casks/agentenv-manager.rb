cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.1.9"
  sha256 arm:   "f82a3570807682b07e30d54cdb3075e8d2096477b87a9d23f48387856a7cf2ad",
         intel: "1d4965f79a1cefe28e81df8691f4d3cdf91d55957fecff03291700f3504c6b4b"

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
