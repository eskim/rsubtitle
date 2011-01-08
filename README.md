Rsubtitle
=========
Ruby parser and formatter for video subtitle

Usage
-----


    >> smi = Rsubtitle::SMI.parse("test/fixtures/utf8.smi")
    => #<Rsubtitle::SMI:0x00000100b5ea68>
    >> smi.entries
    => [#<struct Rsubtitle::Entry start=10, duration=7390, body="first">, ...]
    >> smi.entries[0]
    => #<struct Rsubtitle::Entry start=10, duration=7390, body="first">
    >> smi.entries[0].start
    => 10
    >> smi.entries[0].duration
    => 7390
    >> smi.entries[0].body
    => "first"


TODO
----

* multi-language support
* parse html body
