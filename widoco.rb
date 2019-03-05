
class Widoco < Formula
  desc "Wizard for documenting ontologies. WIDOCO is a step by step generator of HTML templates with the documentation of your ontology. It uses the LODE environment to create part of the template."
  homepage "https://zenodo.org/badge/latestdoi/11427075"
  version "1.4.9"
  url "https://github.com/dgarijo/Widoco/releases/download/v1.4.9/widoco-1.4.9-jar-with-dependencies.jar"
  sha256 "854242bc031f2c6703258d309cfcf644b99517112ace5cfd746197a696898728"

  bottle :unneeded
  depends_on :java => "1.8+"

  def install
    # Need to set JAVA_HOME manually since maven overrides 1.8 with 1.7+
    cmd = Language::Java.java_home_cmd("1.8")
    ENV["JAVA_HOME"] = Utils.popen_read(cmd).chomp
    libexec.install "widoco-#{version}-jar-with-dependencies.jar" => "widoco.jar"
    bin.write_jar_script libexec/"widoco.jar", "widoco"
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
    assert_match version.to_s, shell_output("#{bin}/widoco --version")
  end
end
