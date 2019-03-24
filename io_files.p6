#!/usr/bin/env perl6
# io_files.p6
# example for severeal IO operations
use v6;
use strict;

# use file handle in a traditional way
my $fh = open "chapter6.txt", :r;
my $contents = $fh.slurp;
$fh.close;
say "1st method -> $contents";

# same as above but more clearly
$contents = "chapter6.txt".IO.slurp;
say "2nd method -> $contents";

# or in a procedural form
$contents = slurp "chapter6.txt";
say "3rd method -> $contents";

# line by line
say "4th method -> ";
for 'ist_miting_20190324.txt'.IO.lines -> $line {
    say $line;
}

# creating files
my $fh = open :w, 'some-file.txt';
$fh.say: 'I ♥ writing Perl code';
$fh.close;

# spurt
spurt 'some-file.txt', 'Go Peoples Alliance', :append;

# shell commands
shell 'cat some-file.txt';
shell 'clear; echo "cleared..\n\n"';

# # prompt
# my $name = prompt "What's your name? ";
# say "Hi, $name! Nice to meet you!";
# my $age = prompt("Say your age (number)");
# say "You are $age";

# reading from files
.say for 'ist_miting_20190324.txt'.IO.lines.grep: *.contains: 'İstanbul';
.say for 'ist_miting_20190324.txt'.IO.lines.grep: *.contains: 'merkez';
.say for 'ist_miting_20190324.txt'.IO.lines.head: 5;
