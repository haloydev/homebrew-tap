class Haloy < Formula
  desc "CLI for haloy deployments"
  homepage "https://github.com/haloydev/haloy"
  version "0.1.0-beta.48"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/haloydev/haloy/releases/download/v0.1.0-beta.48/haloy-darwin-arm64"
      sha256 "298ba70ccd90713191f4db5139e5685ff8fa963e43a75fde43e2bc44074e52d6"
    end
    on_intel do
      url "https://github.com/haloydev/haloy/releases/download/v0.1.0-beta.48/haloy-darwin-amd64"
      sha256 "abd97ccaff6e6374c94714765d05ab1afd0c414a82bdd7216a73493a1bb8a500"
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
