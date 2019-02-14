
class Owltools < Formula
  desc "OWLTools (aka OWL2LS - OWL2 Life Sciences) is convenience java API on top of the OWL API. Builds from github repo."
  homepage "https://github.com/owlcollab/owltools"
  version "0.3.0"
  url "https://github.com/owlcollab/owltools.git", :using => :git, :revision => "a69a05a3002c444dc8625c704d936b52a23e47b6"
  sha256 "0d9cd3a62beb74bdc7d634ab535a11aca7dde06c5365aaebde66f3412871b8ed"

  bottle :unneeded
  depends_on :java => "1.8+"
  depends_on "maven" => :build

  def install
    # Need to set JAVA_HOME manually since maven overrides 1.8 with 1.7+
    cmd = Language::Java.java_home_cmd("1.8")
    ENV["JAVA_HOME"] = Utils.popen_read(cmd).chomp
    system "sh", "build.sh"
    bin.install "OWLTools-Runner/bin/owltools" => "owltools"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test Widoco`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    # assert_match version.to_s, shell_output("#{bin}/widoco --version")
  end
end
