class Gostl < Formula
  desc "3D STL viewer and OpenSCAD renderer"
  homepage "https://github.com/philipparndt/gostl"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/philipparndt/gostl/releases/download/v0.5.0/GoSTL_darwin_arm64.tar.gz"
  sha256 "51374550ec4d8802031f68b6422a5ac1c2c0a7311b06ab69e2de5fcdabd3c53d"

  def install
    bin.install "GoSTL" => "gostl"
  end

  test do
    assert_match "GoSTL", shell_output("#{bin}/gostl --help 2>&1", 0)
  end
end
