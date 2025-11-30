class Gostl < Formula
  desc "3D STL viewer and OpenSCAD renderer"
  homepage "https://github.com/philipparndt/gostl"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/philipparndt/gostl/releases/download/v0.5.2/GoSTL_darwin_arm64.tar.gz"
  sha256 "380df978cad5505a9050fa365ef516e6b8c192d9aed319ee26808d2e560f663a"

  def install
    bin.install "GoSTL" => "gostl"
    # Install resource bundle alongside the binary (required for Metal shaders)
    bin.install "GoSTL_GoSTL.bundle"
  end

  test do
    assert_match "GoSTL", shell_output("#{bin}/gostl --help 2>&1", 0)
  end
end
