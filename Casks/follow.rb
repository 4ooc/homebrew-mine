cask "follow" do
  version "0.0.1-alpha.19"
  sha256 "6eb62880c691ae74708f2ba9f57a3115db6d559c5f02e96117e6c242ab19d113"

  url "https://github.com/RSSNext/Follow/releases/download/v#{version}/Follow-#{version}-macos-universal.dmg",
      verified: "github.com/RSSNext/Follow/"
  name "Follow"
  desc "Next generation information browser"
  homepage "https://follow.is/"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+(?:-[\d\w\.]+)?)$/i)
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "Follow.app"

  zap trash: [
    "~/Library/Application Support/Follow/",
    "~/Library/Logs/Follow/",
  ]
end
