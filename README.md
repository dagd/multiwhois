# multiwhois

Run whois queries across multiple implementations of whois, on Linux.

Requires clang.

Currently:

* Includes support for the following clients:
  * freebsd
  * openbsd

* We do not include the original sources in this repo itself, just patches to
  kludge them together into compiling, and scripts to automate that.

* The patch files can be assumed to be under the same license as the client
  they are modifying. Where feasible, all patches should be sent upstream, not
  here.

* There is no fancy runner program to run all the implementations at once.
  Right now this is just a collection of files to get various clients building
  on Linux.

To compile everything, just run `make`. If you want to compile a specific
client, `cd` into it (`impls/<whatever>`) and run `make`. This will download,
patch, and build the source.
