#!/usr/bin/env perl6
# lazy_eval.p6
#
use v6;
use strict;

# infinite list of primes
my @primes = ^∞ .grep: *.is-prime;
say "101st prime is @primes[100]";

# lazily read words from a file
.say for 'chapter6.txt'.IO.lines;

