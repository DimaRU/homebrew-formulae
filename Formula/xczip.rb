class Xczip < Formula
  desc "Create xcframework zip archive for Swift binary package"
  homepage "https://github.com/DimaRU/xczip"
  url "https://github.com/DimaRU/xczip.git", tag: "1.0.0", revision: "1ae6365ff038d61041b607af9f1c9872d7b9b0aa"
  license "MIT"
  head "https://github.com/DimaRU/xczip.git", branch: "master", shallow: false

  depends_on "zlib"

  def install
    system "swift", "build",
           "-c", "release",
           "--disable-sandbox",
           "--build-path", buildpath.to_s

    libexec.install buildpath/"release/xczip" => "xczip"
  end

  test do
    system "#{bin}/xczip", "--help"
  end
end
