# Newport

[Docs](http://spensertruex.com/Newport)

[Reference Manual](https://spensertruex.com/newport-reference-manual)

![Logo for Newport](https://spensertruex.com/static/p-identical-to-p-tiny.png)

(or view sitedoc.md)

Portable shell and system access. Revive the portable OS interface library portions of CLOCC's PORT, with
modern implementations and ASDF.

Provide betterf documentation than was offered at the [now bit rotten site](http://clocc.sourceforge.net/dist/port.html).

Licensed with LGPL (through mandate, since the original was).

FiveAM must be installed for testing to work.

Actual tests (not boilerplate framework code/ASDF-test-op code) belong in the
source where they are testing, with a reader macro #+5am. This way, it is easy
to write tests on specific systems, as with #+(and 5am sbcl), for example.

FiveAM docs: https://common-lisp.net/project/fiveam/docs/Introduction.html
