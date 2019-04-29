;;;;;
title: Newport
url: newport.html
format: md
date: 2019-4-28
;;;;;

Revive the portable OS interface library portions of CLOCC's PORT, with
modern implementations and ASDF.

# Shell access, Pipes
`run-prog`

`pipe-output`

`pipe-input`

`close-pipe`

`with-open-pipe`

# System functions
`getenv`

`finalize`

`variable-special-p`

`variable-not-special`

`arglist`

`compiled-file-p`

`class-slot-list`



`class-slot-initargs`

`structure-slots`

`structure-keyword-constructor`

`structure-boa-constructors`

`structure-copier`

`structure-predicate`

`+month-names+`

`+week-days+`

`+time-zones+`

`tz->string`

`string->tz`

`current-time`

`sysinfo`

# Acknowledgements

To the CL Gardeners project (now defunct) which suggested this activity. To:

bordeaux-threads (threading)

usocket (sockets)

[CLOCC's obsolete PORT](http://clocc.sourceforge.net/dist/port.html)

[trivial gray streams](https://github.com/trivial-gray-streams/trivial-gray-streams)

closer-mop

[cl-fad](https://github.com/edicl/cl-fad) (pathnames)

for obsoleting most of CLOCC PORT. I didn't bother PORT's old equivalents.
