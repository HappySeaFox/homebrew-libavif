class Libavif < Formula
  desc "Library for encoding and decoding .avif files"
  homepage "https://github.com/AOMediaCodec/libavif"
  url "https://github.com/AOMediaCodec/libavif/archive/refs/tags/v0.9.2.tar.gz"
  version "0.9.2"
  sha256 "d6607d654adc40a392da83daa72a4ff802cd750c045a68131c9305639c10fc5c"
  license "BSD"

  depends_on "cmake" => :build

  depends_on "aom"
  depends_on "jpeg-turbo"
  depends_on "libpng"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args, "-DAVIF_CODEC_AOM=ON", "-DAVIF_BUILD_APPS=ON"
      system "make"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/avifdec", "--version"
  end
end
