;;;;;
title: Newport
format: md
date: 2019-4-28
tags: article
;;;;;

Revive the portable OS interface library portions of CLOCC's PORT, with
modern implementations and ASDF.

[Code is on github!](https://github.com/equwal/Newport)


Portable shell and system access. Revive the portable OS interface library
portions of CLOCC's PORT, with modern implementations and ASDF. Provide better
documentation than was ever offered at the now bit rotten site. Licensed with
LGPL (through mandate, since the original was).

# Shell, Pipes, System functions


`CURRENT-TIME`

Print the current time to the stream (defaults to t).

`STRING->TZ`

Find the OBJ (symbol or string) in +TIME-ZONES+.

`TZ->STRING`

Convert the CL timezone (rational [-24;24], multiple of 3600) to a string.

`+TIME-ZONES+`

*The string representations of the time zones.

`+WEEK-DAYS+`

*The names of the days of the week.

`+MONTH-NAMES+`

*The names of the months.

`SYSINFO`

Print the current environment to a stream.

`STRUCTURE-PREDICATE`

Return the structure predicate name.

`STRUCTURE-COPIER`

Return the structure copier name.

`STRUCTURE-BOA-CONSTRUCTORS`

Return the list of structure BOA constructor names.

`STRUCTURE-KEYWORD-CONSTRUCTOR`

Return the structure keyword constructor name.

`STRUCTURE-SLOTS`

Return the list of structure slot names.

`CLASS-SLOT-INITARGS`

Return the list of initargs of a CLASS.
CLASS can be a symbol, a class object (as returned by `class-of')
or an instance of a class.
If the second optional argument ALL is non-NIL (default),
initargs for all slots are returned, otherwise only the slots with
:allocation type :instance are returned.

`CLASS-SLOT-LIST`

Return the list of slots of a CLASS.
CLASS can be a symbol, a class object (as returned by `class-of')
or an instance of a class.
If the second optional argument ALL is non-NIL (default),
all slots are returned, otherwise only the slots with
:allocation type :instance are returned.

`ARGLIST`

Return the signature of the function.

`VARIABLE-NOT-SPECIAL`

Undo the global special declaration.
This returns a _new_ symbol with the same name, package,
fdefinition, and plist as the argument.
This can be confused by imported symbols.
Also, (FUNCTION-LAMBDA-EXPRESSION (FDEFINITION NEW))
will return the OLD (uninterned!) symbol as its 3rd value.
BEWARE!

`VARIABLE-SPECIAL-P`

Return T if the symbol names a global special variable.

`GETENV`

Set an environment variable.

`GETENV`

Return the value of the environment variable.

`DEFAULT-DIRECTORY`

The default directory.

`WITH-OPEN-PIPE`

Open the pipe, do something, then close it.

`CLOSE-PIPE`

Close the pipe stream.

`PIPE-INPUT`

Return an input stream from which the command output will be read.

`PIPE-OUTPUT`

Return an output stream which will go to the command.

`RUN-PROG`

Common interface to shell. Does not return anything useful.

`NOT-IMPLEMENTED`

Your implementation does not support this functionality.

`CODE`

An error in the user code.

`MK-ARR`

Make array with elements of TYPE, initializing.

`COMPOSE`



`DEFCONST`

Define a typed constant.


# Acknowledgements

To the CL Gardeners project (now defunct) which suggested this activity. To:

bordeaux-threads (threading)

usocket (sockets)

[CLOCC's obsolete PORT](http://clocc.sourceforge.net/dist/port.html)

[trivial gray streams](https://github.com/trivial-gray-streams/trivial-gray-streams)

trivial garbage
closer-mop

[cl-fad](https://github.com/edicl/cl-fad) (pathnames)

for obsoleting *most* of CLOCC PORT.
