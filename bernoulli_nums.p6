#!/usr/bin/env perl6
use v6;

# Akiyama-Tanigawa algorithm
#
# bernoulli numbers 
#
sub bernoulli ($n) {
    my @a;
    for 0..$n -> $m {
        @a[$m] = 1 / ($m + 1);

        if $m >= 1 {
            for $m...1 -> $j {
                @a[$j-1] = $j * (@a[$j-1] - @a[$j]);
            }
        }
    }
    return @a[0];
}

for 0..20 -> $n {
    say "bernoulli($n) = { bernoulli($n).perl }";
}

