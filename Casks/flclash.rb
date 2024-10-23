cask "flclash" do
  version "0.8.62"
  sha256 "b8e0f7efdc9ca01e5ed2e6b5fdbca1348aa1ebece93ef426dff4ac504c8d8f05"

  url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-arm64.dmg"
  name "flclash"
  desc "A multi-platform proxy client based on ClashMeta,simple and easy to use, open-source and ad-free."
  homepage "https://github.com/chen08209/FlClash"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on macos: '>= :mojave'

  app "FlClash.app"
end
