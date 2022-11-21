class Envctl < Formula
  desc "In macOs, set environment variables both on shell and GUI App."
  homepage "https://github.com/4ooc/envctl"
  head "https://github.com/4ooc/envctl.git", branch: "main"
  version "1.0"

  def install
        prefix.install Dir["*"]
        bin.install prefix/"envctl.sh" => "envctl"
        zsh_completion.install prefix/"complete/_envctl.zsh" => "_envctl"
  end
end
