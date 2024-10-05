cask "follow-preview" do
  version "0.0.1-nightly.20241004"
  sha256 "82727c9f4b457b648aeb85899298d37d2a3084f4427ff17dcbe48e1935b1b577"

  url "https://github.com/RSSNext/Follow/releases/download/nightly-#{version}/Follow-#{version}-macos-universal.dmg",
      verified: "github.com/RSSNext/Follow/"
  name "Follow-preview"
  desc "Next generation information browser"
  homepage "https://follow.is/"

  livecheck do
    url :stable
    regex(/^nightly-?(\d+(?:\.\d+)+(?:-[\d\w\.]+)?)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  depends_on macos: ">= :catalina"

  app "Follow.app"

  zap trash: [
    "~/Library/Application Support/Follow/",
    "~/Library/Logs/Follow/",
  ]
end
