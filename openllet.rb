# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/frames
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Openllet < Formula
  desc "Openllet is an OWL 2 reasoner in Java, build on top of Pellet."
  homepage "https://github.com/Galigator/openllet"
  url "https://github.com/Complexible/pellet/archive/2.3.1.zip"
  sha256 "d7fae528d08494f7124b638d9017b336112664960c80481e020afe8feb972e0a"
  head "https://github.com/Complexible/pellet", :using => :git

  # depends_on "cmake" => :build
  depends_on "maven" => :build  # if your formula requires any X11/XQuartz components
  head do
      url "https://github.com/Complexible/pellet.git", :using => :git
      depends_on "maven" => :build
  end


  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    if build.head?
        system "mvn", "clean", "install"
    end

    if build.head?
        lib.install Dir["cli/target/pelletcli/lib/*.jar"]
        bin.install Dir["cli/target/pelletcli/bin/*"]
        #bin.install_symlink bin/"pellet"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test pellet`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
