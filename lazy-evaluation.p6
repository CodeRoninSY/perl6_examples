#!/usr/bin/env perl6
#
use v6;

my @fibonacci = 1, 1, { $^a + $^b } ... *;
say @fibonacci[10000];

