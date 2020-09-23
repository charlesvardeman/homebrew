class Tarql < Formula
  desc "SPARQL for Tables: Turn CSV into RDF using SPARQL syntax"
  homepage "https://tarql.github.io/"
  url "https://github.com/tarql/tarql/releases/download/v1.2/tarql-1.2.tar.gz"
  sha256 "7ad7b6233e0bea1d55775b3001fc2486d2f0424d3507e2ee8da09ebd20033774"
  license "BSD-2-Clause"

  depends_on java: "1.8+"
  bottle :unneeded

  def shim_script(target)
    <<~EOS
    #!/usr/bin/env bash
      "#{libexec}/bin/#{target}" "$@"
    EOS
  end

  def install
    libexec.install Dir["*"]
    (bin/"tarql").write shim_script("tarql")
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test tarql`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
