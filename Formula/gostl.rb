class Gostl < Formula
  desc "3D STL viewer and OpenSCAD renderer"
  homepage "https://github.com/philipparndt/gostl"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/philipparndt/gostl/releases/download/v0.5.1/GoSTL_darwin_arm64.tar.gz"
  sha256 "8a7dd0e66a676acef57a15a53bd17eb078db6317ec2f49cbdda33a9ef3bbae18"

  def install
    bin.install "GoSTL" => "gostl"
    # Install resource bundle alongside the binary (required for Metal shaders)
    bin.install "GoSTL_GoSTL.bundle"
  end

  test do
    assert_match "GoSTL", shell_output("#{bin}/gostl --help 2>&1", 0)
  end
end
