use v6;

# map function
say join '-', map {$_ * 2}, 1..7;

(1..7).map({$_ * 2}).say;

# filter function
sub is-even($x) {$x %% 2};
say join '--', map(&is-even, 1..10);
say join '-', map(-> $x {$x %% 2}, 1..10);
say map(-> $x {$x ** 3}, 1..10).perl;

# callback funcs can be named
sub do-twice(&code) { code() for 1..2;}
sub greet {say "Hello World"}
do-twice &greet;

# can be anonymous subroutines
my $greet2 = sub {say "Hello World"};
do-twice $greet2;

# pass the subroutine directly
do-twice sub {say "Hello World"};

# can even be a bare block
do-twice { say "Hello World"};

# reduce built-in
my $sum = reduce { $^a + $^b }, 1..20;
say "reduce[1..20]= $sum";

my $ss1 = [+] 1..20;
say "sum[1..10]= $ss1";
$ss1 = [*] 1..20.0;
say "product[1..20]= $ss1";

# Data::Dumper example in Perl6
my @array_of_hashes = (
{ NAME => 'apple',   type => 'fruit'  },
{ NAME => 'cabbage', type => 'no, please no'  },
);

say @array_of_hashes.perl;

# chaining
my @array = <7 8 9 0 1 2 4 3 5 6 7 8 9>;
my @final-array = @array.unique.sort.reverse;
say @final-array;

# forward feed '==>' from first to final step
say "forward feed ==> ";
@array ==> unique()
    ==> sort()
    ==> reverse()
    ==> my @final-array-v2;
say @final-array-v2;

# backward feed <==
say "Backward feed <== ";
my @final-array-v3 <== reverse()
    <== sort()
    <== unique()
    <== @array;
say @final-array-v3;

say "hyper operator >>. ";
# hyper operator >>. will call a method on all elements of a list and return a list of results
my @array2 = <0 1 2 3 4 5 6 7 8 9 10>;

#sub is-even($var) { $var %% 2 };

say @array2>>.is-prime;
say @array2>>.&is-even;


# junction operator |
my $var2 = 2;
if $var2 == 1|2|3 {
    say "The variable is 1 or 2 or 3";
}


# lazy lists
say "Lazy lists...";
# lazy lists
my $lazylist = (1 ... 10);
say $lazylist;

my $lazylist2 = (1 ... Inf);
say $lazylist2;

my $ll = (0, { $_ + 3 } ...^ * > 10);
say $ll;


# closures
sub generate-greeting {
    my $name = "John Doe";
    sub greeting {
      say "Good Morning $name";
    };
    return &greeting;
}
my $generated = generate-greeting;
$generated();



sub greeting-generator($period) {
  return sub ($name) {
    return "Good $period $name"
  }
}
my $morning = greeting-generator("Morning");
my $evening = greeting-generator("Evening");

say $morning("John");
say $evening("Jane");


# Classes
class Human {
  has $.name;
  has $.age;
  has $.sex;
  has $.nationality;
  # new constructor that overrides the default one.
  method new ($name,$age,$sex,$nationality) {
    self.bless(:$name,:$age,:$sex,:$nationality);
  }
}

my $john = Human.new('John',23,'M','American');
say $john;


# regular expressions
if 'enlightenment' ~~ m/ light / {
    say "enlightenment contains the word light";
}

if 'Temperature: 13' ~~ m/ \: / {
    say "The string provided contains a colon :";
}

if 'Age = 13' ~~ m/ '=' / {
    say "The string provided contains an equal character = ";
}

if 'name@company.com' ~~ m/ "@" / {
    say "This is a valid email address because it contains an @ character";
}

if 'abc' ~~ m/ a.c / {
    say "Match";
}
if 'a2c' ~~ m/ a.c / {
    say "Match";
}
if 'ac' ~~ m/ a.c / {
    say "Match";
} else {
    say "No Match";
}


if 'ac' ~~ m/ a?c / {
    say "Match";
} else {
    say "No Match";
}
if 'c' ~~ m/ a?c / {
    say "Match";
} else {
    say "No Match";
}

