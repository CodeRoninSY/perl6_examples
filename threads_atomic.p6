use v6;
# nothing is atomic
my int $i = 0;
my @threads1 = do for 1..5 -> $id {
    Thread.start: {
        $i++ for ^100000;
    }
}
.join for @threads1;
say $i;
