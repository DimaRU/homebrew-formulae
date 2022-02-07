class QliftUic < Formula
  desc "Generate Swift code from Qt5 user interfaces"
  homepage "https://github.com/DimaRU/QliftUIC"
  url "https://github.com/DimaRU/QliftUIC.git", tag: "0.0.1", revision: "15b3dc89f7f0e78197c90cfdd7ddaf2ea23b5080"
  license "MIT"
  head "https://github.com/DimaRU/QliftUIC.git", branch: "master", shallow: false

  depends_on :xcode => "13.3"
  
  def install
    system "swift", "build",
           "-c", "release",
           "--disable-sandbox",
           "--build-path", buildpath.to_s

    system "install", "-d", "#{prefix}/bin"
    system "install", buildpath/"release/qlift-uic", "#{prefix}/bin"

  end

  test do
    system "#{bin}/qlift-uic", "--help"
  end
end
