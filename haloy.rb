class Haloy < Formula
  desc "CLI for haloy deployments"
  homepage "https://github.com/haloydev/haloy"
  version "0.1.0-beta.51"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/haloydev/haloy/releases/download/v0.1.0-beta.51/haloy-darwin-arm64"
      sha256 "9ace5110314576c04566067e96cc6e846bfde452c50f9de90371423b7f2c97fa"
    end
    on_intel do
      url "https://github.com/haloydev/haloy/releases/download/v0.1.0-beta.51/haloy-darwin-amd64"
      sha256 "a89a9d9e2b28a40a67d7e85423d08d23cfc7a9ec4297cbbf5c30fce50aae85f2"
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
