#  Hping3 for MacOS / homebrew-tap

Homebrew formulae maintained by [@parsa222](https://github.com/parsa222).

## hping3

```sh
brew install parsa222/tap/hping3
```

[hping3](https://github.com/antirez/hping) is a command-line TCP/IP packet
assembler and analyser by Salvatore Sanfilippo ([@antirez](https://github.com/antirez)).

### Why this tap exists

hping3 was removed from homebrew-core, so `brew install hping3` no longer works.

The previous community tap, `draftbrew/tap/hping`, is also gone
([DraftBrew/homebrew-tap](https://github.com/DraftBrew/homebrew-tap) is unavailable
as of 2026-07-28).

The hping.org domain registry changed  and no longer hosts the project. here are the archives:

- website: <https://web.archive.org/web/20170327025302/http://hping.org/>
- docs: <https://web.archive.org/web/20170521052953/http://wiki.hping.org/94/>

### Notes

-  TCL scripting is enabled 

  - homebrew-core built hping3 with --no-tcl. But macOS comes with Tcl 8.5 (install CommandLineTools just in case)   
  TCL scripting is enabled here with `-DUSE_TCL` and `-ltcl`, because hping's 2005 configure only looked for tclsh8.* and libtcl*.so 

- most operations need raw sockets 

- Usage examples: [cellularmitosis's gist](https://gist.github.com/cellularmitosis/a18fc81b74a7365c5162ea6493c89640).    



<br>  **hping is GPL-2.0-only, Copyright (C) 1998, 1999 Salvatore Sanfilippo. this tap adds
packaging only, All credit for hping belongs to [@antirez](https://github.com/antirez).**

---

## Original upstream [`README`](https://github.com/antirez/hping/blob/master/README):



```text
hping3 README file
antirez@invece.org

DESCRIPTION

	hping3 is a network tool able to send custom TCP/IP
	packets and to display target replies like ping do with
	ICMP replies. hping3 can handle fragmentation, and
	almost arbitrary packet size and content, using the
	command line interface.

	Since version 3, hping implements scripting capabilties,
	read the API.txt file under the /docs directory to know
	more about it.

	As a command line utility, hping is useful to test at
	many kind of networking devices like firewalls, routers,
	and so. It can be used as a traceroute alike program over all
	the supported protocols, firewalk usage, OS fingerprinting,
	port-scanner (see the --scan option introduced with hping3),
	TCP/IP stack auditing.

	It's also really a good didactic tool to learn TCP/IP.

	Using Tcl/Tk scripting much more can be done, because
	while the hping3 packet generation code is actually the
	hping2 put there mainly for compatibility with the command
	line interface, all the real news are about scripting.

	See the libs directory for example scripts. To run
	the example scripts type:

		hping3 exec ScriptName.htcl <arguments, if required>

	hping3 is developed and manteined by antirez@invece.org
	with the help of other hackers, and comes under GPL version
	2 of license. Development is open so you can send me
	patches/suggestions/affronts without inhibitions.

	Please check the AUTHORS file for a list of people that
	contribued with code, ideas, bug reports.

	Also vim developer, ee.lbl.gov for tcpdump and GNU in general.

DOCUMENTATION

	For the hping3 API check docs/API.txt

	You can find documentation about hping3 specific functions
	at http://wiki.hping.org

	Make sure to check the page at http://wiki.hping.org/34

DOWNLOAD

	The hping3 primary download site is the following:

		http://www.hping.org

	----------------------------------------------------------------
	How to get the hping3 source code from the anonymous CVS server
	----------------------------------------------------------------

	$ cvs -d :pserver:anonymous@cvs.hping2.sourceforge.net:/cvsroot/hping2 login   

	CVS will ask for the password, just press enter, no password is required

	than type the following to download the full source code.

	$ cvs -z8 -d :pserver:anonymous@cvs.hping2.sourceforge.net:/cvsroot/hping2 checkout hping3s

	-----------------------------------
	How to update your source code tree
	-----------------------------------

	change the current directory to /somewhere/hping2, than just type:

	$ cvs update

REQUIREMENTS

	A supported unix-like OS, gcc, root access.

	Libpcap.

	Tcl/Tk is optional but strongly suggested.

INSTALLATION

	see INSTALL file.

have fun,
antirez
```
