# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Owl2jsonld < Formula
  desc ""
  homepage ""
  url "https://github.com/stain/owl2jsonld/releases/download/0.2.1/owl2jsonld-0.2.1-standalone.jar"
  version "0.2.1"
  sha256 "7727f3d97b047e22832c0e472e2a49e41d2319780a045fc667dc990e6b19e705"

  def install

    libexec.install Dir["*"]
    bin.mkpath


    (bin/"owl2jsonld").write <<-EOS.undent
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

      exec "$JAVACMD" -jar "#{libexec}/owl2jsonld-#{version}-standalone.jar" "$@"
    EOS
    (bin/"owl2jsonld").chmod 0777
    # libexec.install %w[bin]
    # bin.install_symlink libexec/"bin/titan.sh" => "titan"
    # bin.install_symlink libexec/"bin/rexster-console.sh" => "titan-rexster-console"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test owl2jsonld`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
