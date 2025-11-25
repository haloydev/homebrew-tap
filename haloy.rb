class Haloy < Formula
  desc "CLI for haloy deployments"
  homepage "https://github.com/haloydev/haloy"
  version "0.1.0-beta.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/haloydev/haloy/releases/download/v0.1.0-beta.4/haloy-darwin-arm64"
      sha256 "88a27625932676633a42cccc7945706abdbe92e040c2e7eb353c0122cb0112f5"
    end
    on_intel do
      url "https://github.com/haloydev/haloy/releases/download/v0.1.0-beta.4/haloy-darwin-amd64"
      sha256 "1d71c1db85bbd7b0a5398221bb9a4e27c5ea6b429b209bac9cdbf6fdf410c005"
    end
  end

  def install
    binary_name =
      if OS.mac? && Hardware::CPU.arm?
        "haloy-darwin-arm64"
      else
        "haloy-darwin-amd64"
      end
    bin.install binary_name => "haloy"
    generate_completions_from_executable(bin/"haloy", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/haloy version")
  end
end
