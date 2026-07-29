class Hping3 < Formula
  desc "Command-line oriented TCP/IP packet assembler/analyzer"
  homepage "https://github.com/antirez/hping"
  url "https://github.com/parsa222/homebrew-tap/archive/3547c7691742c6eaa31f8402e0ccbb81387c1b99.tar.gz"
  version "3.0.0-alpha-1"
  sha256 "4ea60a7849a6cbc0ceb723781e72ea3569aad0500c2316a686431ebd545a7f34"
  license "GPL-2.0-only"
  head "https://github.com/parsa222/homebrew-tap.git", branch: "master"

  livecheck do
    skip "no upstream releases since 2014"
  end

  depends_on :macos

  uses_from_macos "libpcap"

  def install
    system "./configure", "--no-tcl"

    inreplace "Makefile" do |s|
      s.gsub! "CCOPT= -O2 -Wall", "CCOPT= -O2 -Wall -DUSE_TCL"
      s.gsub! "$(PCAP)", "$(PCAP) -ltcl"
    end

    system "make"

    sbin.install "hping3"
    man8.install "docs/hping3.8"
    doc.install "docs/API.txt", "docs/APD.txt", "docs/HPING2-HOWTO.txt", "docs/SPOOFED_SCAN.txt"
    pkgshare.install "lib"
  end

  def caveats
    <<~EOS
      hping3 needs raw sockets; run it with sudo:
        sudo hping3 -S example.com -p 80

      Scripting mode takes no flag. Run hping3 with no arguments, or
      `hping3 exec script.htcl`. Example scripts are in #{pkgshare}/lib
      and the scripting API is documented in #{doc}/API.txt.
    EOS
  end

  test do
    output = shell_output("#{sbin}/hping3 -v")
    assert_match "hping version", output
    assert_match "TCL scripting capable", output

    assert_equal "127.0.0.1",
                 pipe_output("#{sbin}/hping3 exec", "puts [hping resolve localhost]").strip
  end
end