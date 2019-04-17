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


my $t = " " xx 4;
class Journey {
    # error if origin is not provided
    has $.origin is required;
    # set the destination to Orlando as default (unless that is the origin!)
    has $.destination = self.origin eq 'Orlando' ?? 'Kampala' !! 'Orlando';
    has @!travelers;
    has Str $.notes is rw;

    method add-traveler($name) {
        if $name ne any(@!travelers) {
            push @!travelers, $name;
        }
        else {
            warn "$name is already going on the journey!";
        }
    }

    method describe() {
        "From $!origin to $!destination"
    }

    multi method notes() { "$!notes\n" };
    multi method notes( Str $note ) { $!notes ~= "$note\n$t" };

    method Str { "⤷ $!origin\n$t" ~ self.notes() ~ "$!destination ⤶\n" };
}

# Create a new instance of the class.
my $vacation = Journey.new(
    origin      => 'Sweden',
    destination => 'Switzerland',
    notes       => 'Pack hiking gear!'
);

# Use an accessor; this outputs Sweden.
say $vacation.origin;

# Use an rw accessor to change the value.
# $vacation.notes = 'Pack hiking gear and sunglasses!';

# say $vacation.notes;

my $trip = Journey.new( :origin<Here>, :destination<There>,
                        travelers => <þor Freya> );

$trip.notes("First steps");
notes $trip: "Almost there";
print $trip;
