# Homebrew formula for pilotdroid-cli (binary install, avoids Gatekeeper
# quarantine that hits bare-download users).
#
# sha256s are prefilled from the v0.6.2 release assets (verified against
# the published SHA256SUMS.txt); bump on the next release.
class Pilotdroid < Formula
  desc "Android automation: persistent device-side agent + binary protocol CLI"
  homepage "https://github.com/mofanx/pilotdroid"
  version "0.6.2"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/mofanx/pilotdroid/releases/download/v0.6.2/pilotdroid-cli-macos-arm64"
    sha256 "3a5b8b55c34167ba0c448a362140a620e35e7b3b21d934a1353ab39ced893121"

    def install
      bin.install "pilotdroid-cli-macos-arm64" => "pilotdroid-cli"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/mofanx/pilotdroid/releases/download/v0.6.2/pilotdroid-cli-linux-x86_64"
    sha256 "9c90e5a6479be9790c5c04d9ce3729427f663f76a07bd0b1c6d49ef702f43aa8"

    def install
      bin.install "pilotdroid-cli-linux-x86_64" => "pilotdroid-cli"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pilotdroid-cli --version")
  end
end
