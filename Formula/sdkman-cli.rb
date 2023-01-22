class SdkmanCli < Formula
  desc "Sdkman - The Software Development Kit Manager"
  homepage "https://sdkman.io"
  url "https://github.com/4ooc/sdkman-cli/releases/download/5.16.0.fix/sdkman-cli-5.16.0.fix.zip"
  version "5.16.0.fix"
  sha256 "9a1fba429245386b1600355cbeabbe5aee169191e1368e45b36b46e55aaa4ad2"
  license "Apache-2.0"

  def install
    prefix.install Dir["*"]

    %w[tmp ext var].each { |dir| mkdir prefix/dir }
    %w[etc candidates].each { |dir| mkdir pkgetc/dir }

    prefix.install_symlink pkgetc/"etc"
    prefix.install_symlink pkgetc/"candidates"

    system "curl", "-s", "https://api.sdkman.io/2/candidates/all", "-o", prefix/"var/candidates"

    (prefix/"etc/config").open('a+') {|f|
      if f.size <= 0
        f.write <<~EOS
          SDKMAN_OFFLINE_MODE=false
          sdkman_auto_answer=false
          sdkman_auto_complete=true
          sdkman_auto_env=false
          sdkman_auto_update=false
          sdkman_beta_channel=false
          sdkman_colour_enable=true
          sdkman_curl_connect_timeout=7
          sdkman_curl_max_time=10
          sdkman_debug_mode=false
          sdkman_insecure_ssl=false
          sdkman_rosetta2_compatible=false
          sdkman_selfupdate_feature=false
        EOS
      end
    }
  end

  def caveats
    <<~EOS
      Add the following to #{shell_profile} or your desired shell configuration file:
          export SDKMAN_DIR=$(brew --prefix sdkman-cli)
          [[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
    EOS
  end

  test do
    assert_match version, shell_output("export SDKMAN_DIR=#{prefix} && source #{prefix}/bin/sdkman-init.sh && sdk version")
  end
end
