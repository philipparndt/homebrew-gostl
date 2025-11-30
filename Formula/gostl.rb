class Gostl < Formula
  desc "3D STL viewer and OpenSCAD renderer"
  homepage "https://github.com/philipparndt/gostl"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/philipparndt/gostl/releases/download/v0.5.3/GoSTL_darwin_arm64.tar.gz"
  sha256 "e04521a2d48244b672d7ef47c6557f0b3961875eb0dd909b780b13a7d6905128"

  def install
    bin.install "GoSTL" => "gostl"
    # Install resource bundle alongside the binary (required for Metal shaders)
    bin.install "GoSTL_GoSTL.bundle"
    # Create symlink in HOMEBREW_PREFIX/bin so bundle is found when running via symlink
    (HOMEBREW_PREFIX/"bin/GoSTL_GoSTL.bundle").make_relative_symlink(bin/"GoSTL_GoSTL.bundle")
  end

  test do
    # Just verify the binary and bundle exist (GUI app can't be tested in CI)
    assert_predicate bin/"gostl", :exist?
    assert_predicate bin/"GoSTL_GoSTL.bundle/Contents/Resources/default.metallib", :exist?
  end
end
