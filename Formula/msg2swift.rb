class Msg2swift < Formula
  desc "Generate Swift model for ROS message file."
  homepage "https://github.com/DimaRU/Msg2swift"
  url "https://github.com/DimaRU/Msg2swift.git", tag: "v1.0.0", revision: "88009d475483ad58ec1cb41080546178ff1dc48f"
  license "MIT"
  head "https://github.com/DimaRU/Msg2swift.git", branch: "master", shallow: false

  depends_on :xcode => "14.3"

  def install
    system "swift", "build",
           "-c", "release",
           "--disable-sandbox",
           "--build-path", buildpath.to_s

    system "install", "-d", "#{prefix}/bin"
    system "install", buildpath/"release/msg2swift", "#{prefix}/bin"

  end

  test do
    system "#{bin}/msg2swift", "--help"
  end
end
