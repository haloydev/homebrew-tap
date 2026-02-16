class Haloy < Formula
  desc "CLI for haloy deployments"
  homepage "https://github.com/haloydev/haloy"
  version "0.1.0-beta.35"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/haloydev/haloy/releases/download/v0.1.0-beta.35/haloy-darwin-arm64"
      sha256 "e8ce4304587cabc5a2ecfeb53e302c879bee50ebe5f86d1d97761d2e70871fff"
    end
    on_intel do
      url "https://github.com/haloydev/haloy/releases/download/v0.1.0-beta.35/haloy-darwin-amd64"
      sha256 "4fd023da1d3a7ac08fa49accb6587411893b9fbde9b5323ba10f0da3f1cd0858"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "haloy-darwin-arm64" : "haloy-darwin-amd64"
    bin.install binary_name => "haloy"
    chmod 0755, bin/"haloy"
    generate_completions_from_executable(bin/"haloy", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/haloy version")
  end
end
