class Haloy < Formula
  desc "CLI for haloy deployments"
  homepage "https://github.com/haloydev/haloy"
  version "0.1.0-beta.72"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/haloydev/haloy/releases/download/v0.1.0-beta.72/haloy-darwin-arm64"
      sha256 "d3abfe0ace6bbd1feaa3d2a2eba59ea00653771c02c6e52643552955779fbea5"
    end
    on_intel do
      url "https://github.com/haloydev/haloy/releases/download/v0.1.0-beta.72/haloy-darwin-amd64"
      sha256 "e9ab1cc894363c32bfb48c46e9c30ffbf432934d0cab65444dc22e9f3e09c556"
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
