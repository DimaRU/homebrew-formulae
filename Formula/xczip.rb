class Xczip < Formula
  desc "Create xcframework zip archive for Swift binary package"
  homepage "https://github.com/DimaRU/xczip"
  url "https://github.com/DimaRU/xczip.git", tag: "1.1.0", revision: "6bc52cfd3ae3eb8cdc254cb0e1582f1d7431afa7"
  license "MIT"
  head "https://github.com/DimaRU/xczip.git", branch: "master", shallow: false

  depends_on "zlib"

  def install
    system "swift", "build",
           "-c", "release",
           "--disable-sandbox",
           "--build-path", buildpath.to_s

    system "install", "-d", "#{prefix}/bin"
    system "install", buildpath/"release/xczip", "#{prefix}/bin"

  end

  test do
    system "#{bin}/xczip", "--help"
  end
end
