# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Owl2jsonld < Formula
  desc ""
  homepage ""
  url "https://github.com/stain/owl2jsonld/releases/download/0.2.1/owl2jsonld-0.2.1-standalone.jar"
  version "0.2.1"
  sha256 "7727f3d97b047e22832c0e472e2a49e41d2319780a045fc667dc990e6b19e705"

  bottle :unneeded
  depends_on :java => "1.8+"

  def install
    # Need to set JAVA_HOME manually since maven overrides 1.8 with 1.7+
    cmd = Language::Java.java_home_cmd("1.8")
    ENV["JAVA_HOME"] = Utils.popen_read(cmd).chomp
    libexec.install "owl2jsonld-#{version}-standalone.jar" => "owl2jsonld.jar"
    bin.write_jar_script libexec/"owl2jsonld.jar", "owl2jsonld"
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
    assert_match version.to_s, shell_output("#{bin}/owl2jsonld --version")
  end

end
