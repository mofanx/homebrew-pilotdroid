# Homebrew formula for pilotdroid-cli (binary install, avoids Gatekeeper
# quarantine that hits bare-download users).
#
# sha256s are prefilled from the v0.6.0 release assets (verified against
# the published SHA256SUMS.txt); bump on the next release.
class Pilotdroid < Formula
  desc "Android automation: persistent device-side agent + binary protocol CLI"
  homepage "https://github.com/mofanx/pilotdroid"
  version "0.6.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/mofanx/pilotdroid/releases/download/v0.6.0/pilotdroid-cli-macos-arm64"
    sha256 "1fe32df8e0c5598b84c5e44ab649df3d7db5f91bca12a991fce0486c068cb538"

    def install
      bin.install "pilotdroid-cli-macos-arm64" => "pilotdroid-cli"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/mofanx/pilotdroid/releases/download/v0.6.0/pilotdroid-cli-linux-x86_64"
    sha256 "28b0cbaad7fe450671cd0485f9839739bba4655c791953de889d0ccd50f63425"

    def install
      bin.install "pilotdroid-cli-linux-x86_64" => "pilotdroid-cli"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pilotdroid-cli --version")
  end
end
