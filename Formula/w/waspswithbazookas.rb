class Waspswithbazookas < Formula
  desc "Distributed HTTP/S load testing tool with cluster-based architecture"
  homepage "https://github.com/Phara0h/WaspsWithBazookas"
  url "https://github.com/Phara0h/WaspsWithBazookas/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "4431aab8993b1b7bb0cd447b9d6c076e1439ebe36fb3d28b15d2640e0a8b1290"
  license "GPL-2.0-or-later"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  on_linux do
    depends_on "openssl@3"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hive --version")
    assert_match version.to_s, shell_output("#{bin}/wasp --version")
    assert_match version.to_s, shell_output("#{bin}/test-dummy --version")
  end
end
