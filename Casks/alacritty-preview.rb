cask "alacritty-preview" do
  version "0.13.2"
  sha256 "c71ce23fc365c4d046de2a48161d26232a5734c519e6b5ff3f55c60258260f60"

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
