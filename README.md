# Mediatriple Homebrew Tap

Homebrew formulae for [Mediatriple](https://mediatriple.com) tools.

## cdnctl

Official command-line interface for [cdn.com.tr](https://cdn.com.tr) — purge CDN cache, deploy and
manage container apps from Docker Compose, handle S3-compatible object storage and transfer files
from your terminal. Source: [mediatriple/cdnctl](https://github.com/mediatriple/cdnctl).

```bash
brew tap mediatriple/tap
brew install cdnctl
```

Or in one line:

```bash
brew install mediatriple/tap/cdnctl
```

Upgrade with `brew upgrade cdnctl`. (In a Homebrew install, `cdnctl update` deliberately defers to
Homebrew rather than overwriting the managed binary.)

Works on macOS (Intel + Apple Silicon) and Linux.
