class Gostl < Formula
  desc "3D STL viewer and OpenSCAD renderer"
  homepage "https://github.com/philipparndt/gostl"
  version "0.10.0"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/philipparndt/gostl/releases/download/v0.10.0/GoSTL_darwin_arm64.tar.gz"
  sha256 "629087a06eb627e60abe5359406819831d843bdd193882357e8975b9f2cbdd8c"

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
