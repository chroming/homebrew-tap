cask "agentenv-manager" do
  arch arm: "arm64", intel: "x64"

  version "0.2.2"
  sha256 arm:   "6ab1852fb8d18b4399e4fc5b7b011934e97e9ff3d32a09d63f90ecc325f4227e",
         intel: "da7cb0d4e626e4910a2bf53b73bb533fef6292e6d664531cb871fbe1663e6c0b"

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
