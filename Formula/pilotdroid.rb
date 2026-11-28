# Homebrew formula for pilotdroid-cli (binary install, avoids Gatekeeper
# quarantine that hits bare-download users).
#
# sha256s are prefilled from the v0.8.4 release assets (verified against
# the published SHA256SUMS.txt); bump on the next release.
class Pilotdroid < Formula
  desc "Android automation: persistent device-side agent + binary protocol CLI"
  homepage "https://github.com/mofanx/pilotdroid"
  version "0.8.4"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/mofanx/pilotdroid/releases/download/v0.8.4/pilotdroid-cli-macos-arm64"
    sha256 "ded7c4e5dd2502d17ff40413a9653769f6b8ddae43800f0d13b6d085372a9c94"

    def install
      bin.install "pilotdroid-cli-macos-arm64" => "pilotdroid-cli"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/mofanx/pilotdroid/releases/download/v0.8.4/pilotdroid-cli-linux-x86_64"
    sha256 "548391c7624376ae03e286a2707e0951e46e7b398ed3e3f6d132dbdcf6d06609"

    def install
      bin.install "pilotdroid-cli-linux-x86_64" => "pilotdroid-cli"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pilotdroid-cli --version")
  end
end
