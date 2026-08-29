class Cdnctl < Formula
  desc "Official CLI for cdn.com.tr: CDN cache purge, container apps, object storage"
  homepage "https://cdn.com.tr"
  url "https://github.com/mediatriple/cdnctl/archive/refs/tags/v0.19.0.tar.gz"
  sha256 "9a8326c3c924c9148856e4d1d0ec98d8b30a910f19c4131155b1ddc127e9370f"
  license "MIT"
  head "https://github.com/mediatriple/cdnctl.git", branch: "main"

  depends_on "go" => :build

  def install
    # installChannel=homebrew makes `cdnctl update` refuse to replace the
    # Homebrew-managed binary and point at `brew upgrade` instead.
    ldflags = "-s -w -X main.version=#{version} -X main.installChannel=homebrew"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    # cdnctl prints its usage banner (starting with the version) and exits 2
    # when invoked with no arguments.
    output = shell_output("#{bin}/cdnctl 2>&1", 2)
    assert_match "cdnctl #{version}", output

    # Self-update must defer to Homebrew in this build.
    assert_match "brew upgrade cdnctl", shell_output("#{bin}/cdnctl update --check 2>&1", 0)
  end
end
