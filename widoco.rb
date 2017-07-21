
class Widoco < Formula
  desc "Wizard for documenting ontologies. WIDOCO is a step by step generator of HTML templates with the documentation of your ontology. It uses the LODE environment to create part of the template."
  homepage "https://zenodo.org/badge/latestdoi/11427075"
  version "1.4.1"
  url "https://github.com/dgarijo/Widoco/releases/download/v1.4.1/widoco-1.4.1-jar-with-dependencies.jar"
  sha256 "dca272ff81ead2a806bd0c57d8b6a86b5d6ff6f43c5abf5c718a1da21a16fb98"

  # depends_on "cmake" => :build
  def install

    libexec.install Dir["*"]
    bin.mkpath


    (bin/"widoco").write <<-EOS.undent
      #!/bin/bash
      # resolve links - $0 may be a softlink

      # If a specific java binary isn't specified search for the standard 'java' binary
      if [ -z "$JAVACMD" ] ; then
        if [ -n "$JAVA_HOME"  ] ; then
         if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
         # IBM's JDK on AIX uses strange locations for the executables
           JAVACMD="$JAVA_HOME/jre/sh/java"
         else
           JAVACMD="$JAVA_HOME/bin/java"
         fi
       else
        JAVACMD=`which java`
       fi
      fi

      if [ ! -x "$JAVACMD" ] ; then
       echo "Error: JAVA_HOME is not defined correctly." 1>&2
       echo "  We cannot execute $JAVACMD" 1>&2
       exit 1
      fi

      exec "$JAVACMD" -jar "#{libexec}/widoco-#{version}-jar-with-dependencies.jar" "$@"
    EOS
    chmod 0755, bin/"widoco"
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
    system "false"
  end
end
