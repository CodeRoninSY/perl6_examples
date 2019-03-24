#!/usr/bin/env perl6
#
# parser.p6
# Parser example for Perl6

grammar Parser {
    rule TOP { I <love> <lang> }
    token love { '♡' | love }
    token lang { < Perl Python Fortran Clojure C++ Shell > }
}

say Parser.parse: 'I ♡ Perl';

say Parser.parse: 'I love Python';

