#!/usr/bin/env perl6
# perl6_intro.p6
# 2016 perl6 for beginners- Patrick Michaud; part 2
#

# my $filename = "chapter6.txt";
# my $filename2 = "_delete_this.txt";
#
# # read file entirely
# my $whole-file = slurp $filename;
# say $whole-file.perl;
#
# # or into an array of lines by getting an IO handle
# my @lines = $filename.IO.lines;
# say @lines.perl;
#
# my @lame-core = "lame = zayıf / etkisiz / mazeret / ezik;
#     lame duck = sakat;
#     lame excuse = sudan bahane;
#     lame-core = dandik;
#     lame-ass = yorgun / bitik;\n";
#
# say @lame-core.perl;
# say @lame-core.WHAT;
#
# # write directly to a file
# spurt $filename2, @lame-core, :append;

# # conditionals
# my $num = prompt "Enter a number: ";
# if $num < 0 {
#     say "Negative";
# }
# elsif $num > 0 {
#     say "Positive";
# }
# else {
#     say "Zero";
# }
#
# # given/when
# given prompt "Enter a number: " {
#     when * < 0 {
#         say "Negative";
#     }
#     when * > 0 {
#         say "Positive";
#     }
#     default {
#         say "Zero";
#     }
# }


# # loops
# loop (my $i = 10; $i > 0; $i--) {
#     say $i;
# }
# say "LIFT OFF";

# # while
# my @tasks;
# while @tasks.elems < 2 {
#     @tasks.push(prompt("Enter a task: "));
# }
#
# my @tasks2;
# until @tasks2.elems == 1 {
#     @tasks2.push(prompt("Enter a task: "));
# }
#
# # -> pointy block syntax is used to scope the iteration variable ...
# # ... cleanly to the block
# for @tasks -> $task {
#     say $task.tclc;
# }

# iterate over key-value pairs
my %capitals = TR => 'Istanbul', AZ => 'Bakü';

say %capitals.perl;
say %capitals.kv.perl;

for %capitals.kv -> $country, $city {
    say "$city is the capital of $country";
}

my @nums = [1, 1, 2, 3, 5, 8, 13, 21, 34];
say @nums.perl;
say @nums.kv.perl;

# iterate over array elements
for @nums.kv -> $id, $val {
    say "$id, $val";
}

my @frutti = <elma muz armut kayısı portakal kiraz>;
say @frutti;
say @frutti.kv;
say @frutti.perl;
say @frutti.kv.perl;

# shuffle and randomly pair array elems
my @dancers = <Tuğba Şener Gamze İlker Alya Elif Ali Nazan>;
for @dancers.pick(*) -> $f1, $f2 {
    say "$f1 dances with $f2";
}

# poiny blocks can go solo
my $greeter= -> $greeting, $name { say "$greeting, $name" };

$greeter('Yo!', 'Hector');


