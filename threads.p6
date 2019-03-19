use v6;

my @threads = do for 1..5 -> $id {
    Thread.start: {
        say "Hi from thread $id";
        sleep 1;
        say "Bye from thread $id";
    }
}
.join for @threads;

