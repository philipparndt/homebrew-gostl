class Gostl < Formula
  desc "3D STL viewer and OpenSCAD renderer"
  homepage "https://github.com/philipparndt/gostl"
  version "0.8.0"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/philipparndt/gostl/releases/download/v0.8.0/GoSTL_darwin_arm64.tar.gz"
  sha256 "5a3b43ffcf37570083a1b477fbc15e446ae250eaa0eb83d2133da86c791219c8"

  def install
    bin.install "GoSTL" => "gostl"
    # Install resource bundle alongside the binary (required for Metal shaders)
    bin.install "GoSTL_GoSTL.bundle"
  end

  def post_install
    # Create symlink in HOMEBREW_PREFIX/bin so bundle is found when running via symlink
    bundle_link = HOMEBREW_PREFIX/"bin/GoSTL_GoSTL.bundle"
    bundle_link.unlink if bundle_link.symlink?
    bundle_link.make_symlink(opt_bin/"GoSTL_GoSTL.bundle")
  end

  test do
    # Just verify the binary and bundle exist (GUI app can't be tested in CI)
    assert_predicate bin/"gostl", :exist?
    assert_predicate bin/"GoSTL_GoSTL.bundle/Contents/Resources/default.metallib", :exist?
  end
end
