# Homebrew formula for pilotdroid-cli (binary install, avoids Gatekeeper
# quarantine that hits bare-download users).
#
# sha256s are prefilled from the v0.7.0 release assets (verified against
# the published SHA256SUMS.txt); bump on the next release.
class Pilotdroid < Formula
  desc "Android automation: persistent device-side agent + binary protocol CLI"
  homepage "https://github.com/mofanx/pilotdroid"
  version "0.7.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/mofanx/pilotdroid/releases/download/v0.7.0/pilotdroid-cli-macos-arm64"
    sha256 "a55fe2f47232fbb4d952f9c7c7bc16f66ffb5aa71be776001c5ca95015e2b143"

    def install
      bin.install "pilotdroid-cli-macos-arm64" => "pilotdroid-cli"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/mofanx/pilotdroid/releases/download/v0.7.0/pilotdroid-cli-linux-x86_64"
    sha256 "64692eec9c35a9b203dee94ee5c740d74d9c811cdb4ff29b6352a1a8902cb4b2"

    def install
      bin.install "pilotdroid-cli-linux-x86_64" => "pilotdroid-cli"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pilotdroid-cli --version")
  end
end
