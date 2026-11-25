# Homebrew formula for pilotdroid-cli (binary install, avoids Gatekeeper
# quarantine that hits bare-download users).
#
# sha256s are prefilled from the v0.6.3 release assets (verified against
# the published SHA256SUMS.txt); bump on the next release.
class Pilotdroid < Formula
  desc "Android automation: persistent device-side agent + binary protocol CLI"
  homepage "https://github.com/mofanx/pilotdroid"
  version "0.6.3"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/mofanx/pilotdroid/releases/download/v0.6.3/pilotdroid-cli-macos-arm64"
    sha256 "a2cf892d7c89c2fd30ab1ebb0dc4f0ecbcf94e6213ef9f34dcaf69000b83809d"

    def install
      bin.install "pilotdroid-cli-macos-arm64" => "pilotdroid-cli"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/mofanx/pilotdroid/releases/download/v0.6.3/pilotdroid-cli-linux-x86_64"
    sha256 "9c11a6920c8747e5467665901ce4b7b2b42a41c8ba78915d498e4bd4c5f0a032"

    def install
      bin.install "pilotdroid-cli-linux-x86_64" => "pilotdroid-cli"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pilotdroid-cli --version")
  end
end
