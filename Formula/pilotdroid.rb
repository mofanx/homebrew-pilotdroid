# Homebrew formula for pilotdroid-cli (binary install, avoids Gatekeeper
# quarantine that hits bare-download users).
#
# TODO(release): fill sha256 once the v0.6.0 tag + release assets exist:
#   gh release download v0.6.0 -R mofanx/pilotdroid -p '*macos-arm64*'
#   shasum -a 256 pilotdroid-cli-macos-arm64
class Pilotdroid < Formula
  desc "Android automation: persistent device-side agent + binary protocol CLI"
  homepage "https://github.com/mofanx/pilotdroid"
  url "https://github.com/mofanx/pilotdroid/releases/download/v0.6.0/pilotdroid-cli-macos-arm64"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  version "0.6.0"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "pilotdroid-cli-macos-arm64" => "pilotdroid-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pilotdroid-cli --version")
  end
end
