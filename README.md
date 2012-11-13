rpi-gp.io
===========

A Raspberry Pi GPIO library for Io

Intro
=====
This library is pretty self explanitory, use the source, Luke!

Usage
=====
Include the library at the top of your script with:

    doFile("rpi-gp.io")

It will throw an exception if you're not running as root.

From there on, use it similarly to how you'd use Arduino/Wiring,
with the exception that it's wrapped up inside the GPIO object:

    GPIO enablePin(4)
    GPIO pinMode(4, GPIO out)
    GPIO digitalWrite(4, GPIO high)
    GPIO disablePin(4)

License
=======
WTFPLv2, embedded in the source.
