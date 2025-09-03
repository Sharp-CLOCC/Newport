# Newport

[Docs](http://therealtruex.com/Newport)

[Reference Manual](https://therealtruex.com/newport-reference-manual)

![Logo for Newport](/docs/logo.png)

(or view sitedoc.md)

Portable shell and system access. Revive the portable OS interface library portions of CLOCC's PORT, with
modern implementations and ASDF.

Provide better documentation than was offered at the [ancient site](http://clocc.sourceforge.net/dist/port.html).

Licensed with LGPL (through mandate, since the original was).

FiveAM must be installed for testing to work.

Actual tests (not boilerplate framework code/ASDF-test-op code) belong in the
source where they are testing, with a reader macro #+5am. This way, it is easy
to write tests on specific systems, as with #+(and 5am sbcl), for example.

FiveAM docs: https://common-lisp.net/project/fiveam/docs/Introduction.html

# Just want portable POSIX pipes?

[posix-pipes](https://therealtruex.com/posts/POSIX-pipes-for-Lisp). Portable pipes from CLOCC.
