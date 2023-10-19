cask "alacritty-preview" do
  version "0.12.3"
  sha256 "7fc3220a3ad93ab2e555d2a9724506fc314ca4beaa81ce16e43cb3e9c06f1a93"

  url "https://github.com/alacritty/alacritty/releases/download/v#{version}/Alacritty-v#{version}.dmg"
  name "Alacritty"
  desc "GPU-accelerated terminal emulator"
  homepage "https://github.com/alacritty/alacritty/"

  livecheck do
    url :url
    regex(/^v?(0.\d+(?:[.-][0-9rc]+)+)$/i)
    strategy :git do |tags, regex|
      tags.map { |tag| tag[regex, 1] }
    end
  end

  app "Alacritty.app"
  binary "#{appdir}/Alacritty.app/Contents/MacOS/alacritty"
  binary "#{appdir}/Alacritty.app/Contents/Resources/completions/_alacritty",
         target: "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_alacritty"
  binary "#{appdir}/Alacritty.app/Contents/Resources/completions/alacritty.bash",
         target: "#{HOMEBREW_PREFIX}/etc/bash_completion.d/alacritty"
  binary "#{appdir}/Alacritty.app/Contents/Resources/completions/alacritty.fish",
         target: "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/alacritty.fish"
  binary "#{appdir}/Alacritty.app/Contents/Resources/61/alacritty",
         target: "#{ENV.fetch("TERMINFO", "#{Dir.home}/.terminfo")}/61/alacritty"
  binary "#{appdir}/Alacritty.app/Contents/Resources/61/alacritty-direct",
         target: "#{ENV.fetch("TERMINFO", "#{Dir.home}/.terminfo")}/61/alacritty-direct"
  manpage "#{appdir}/Alacritty.app/Contents/Resources/alacritty.1.gz"
  manpage "#{appdir}/Alacritty.app/Contents/Resources/alacritty-msg.1.gz"

  zap trash: [
    "~/Library/Preferences/io.alacritty.plist",
    "~/Library/Saved Application State/io.alacritty.savedState",
  ]
end
