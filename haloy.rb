class Haloy < Formula
  desc "CLI for haloy deployments"
  homepage "https://github.com/haloydev/haloy"
  version "0.1.0-beta.43"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/haloydev/haloy/releases/download/v0.1.0-beta.43/haloy-darwin-arm64"
      sha256 "7fcb35526e7e928cfa1148bec126d8eea649603850f87baea1ad4aa490f2a5ad"
    end
    on_intel do
      url "https://github.com/haloydev/haloy/releases/download/v0.1.0-beta.43/haloy-darwin-amd64"
      sha256 "157f0c6424aa47c0c4a57801a82e0a162bb752a7629ce38c4d4b69b2f8fa50a9"
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
