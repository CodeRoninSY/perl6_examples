#!/usr/bin/env perl6
#
# classes_objects.p6
# http://docs.perl6.org/language/classtut


use v6;
use strict;
use worries;


class Point {
    has Int $.x;
    has Int $.y;
}


class Rectangle {
    has Point $.lower;
    has Point $.upper;

    method area() returns Int {
        ($!upper.x - $!lower.x) * ( $!upper.y - $!lower.y );
    }
}

my $r = Rectangle.new(lower => Point.new(x => 0, y => 0),
                    upper => Point.new(x => 10, y => 10));

# say $r.area();


#taken from https://medium.freecodecamp.org/a-short-overview-of-object-oriented-software-design-c7aa0a622c83
class Hero {
    has @!inventory;
    has Str $.name;
    submethod BUILD( :$name, :@inventory  ) {
        $!name = $name;
        @!inventory = @inventory
    }

    method act {
        return @!inventory.pick;
    }
}

my $hero = Hero.new(:name('Thor'),
                    :inventory(['Mjölnir','Jarnbjorn','Odinsword',
                            'Megingjord','Chariot','Bilskirnir','Bifrost']));

say $hero.act;



# class Task {
#     has      &!callback;
#     has Task @!dependencies;
#     has Bool $.done;
#
#     # Normally doesn't need to be written
#     method new(&callback, *@dependencies) {
#         return self.bless(:&callback, :@dependencies);
#     }
#
#     # BUILD is the equivalent of a constructor in other languages
#     submethod BUILD(:&!callback, :@!dependencies) { }
#
#     method add-dependency(Task $dependency) {
#         push @!dependencies, $dependency;
#     }
#
#     method perform() {
#         unless $!done {
#             .perform() for @!dependencies;
#             &!callback();
#             $!done = True;
#         }
#     }
# }
#
# my $eat =
#     Task.new({ say 'eating dinner. NOM!' },
#         Task.new({ say 'making dinner' },
#             Task.new({ say 'buying food' },
#                 Task.new({ say 'making some money' }),
#                 Task.new({ say 'going to the store' })
#             ),
#             Task.new({ say 'cleaning kitchen' })
#         )
#     );
#
# $eat.perform();



my Range $rg = 'α'..'ω';
say $rg.pick(7);

