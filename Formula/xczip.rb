class Xczip < Formula
  desc "Create xcframework zip archive for Swift binary package"
  homepage "https://github.com/DimaRU/xczip"
  url "https://github.com/DimaRU/xczip.git", tag: "1.2.0", revision: "5ea576c12104ac1ceac59e876055fea5490414ff"
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
