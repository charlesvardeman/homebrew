class Robot < Formula
  desc "Ontology ROBOT is an OBO Tool"
  homepage "https://robot.obolibrary.org"
  url "https://github.com/ontodev/robot/releases/download/v1.7.0/robot.jar"
  sha256 "08ea9291db8692773ef67c99479bf1e565b882b8581f1f141afd0019485d12eb"
  license "BSD-3-Clause"

  bottle :unneeded
  depends_on "openjdk"

  def install
    libexec.install "robot.jar"
    (bin/"robot").write <<~EOS
      #!/bin/bash
      exec "#{Formula["openjdk"].opt_bin}/java" $JAVA_OPTS -jar "#{libexec}/robot.jar" "$@"
    EOS
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test robot`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
