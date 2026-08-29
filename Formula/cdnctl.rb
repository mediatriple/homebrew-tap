class Cdnctl < Formula
  desc "Official CLI for cdn.com.tr: CDN cache purge, container apps, object storage"
  homepage "https://cdn.com.tr"
  url "https://github.com/mediatriple/cdnctl/archive/refs/tags/v0.21.2.tar.gz"
  sha256 "4820807a67f2a6faaa07660fa7b43b59f69ddea10218be2714489f38b5696743"
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
