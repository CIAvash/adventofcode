#!/usr/bin/env perl6

# Part 1
# say [max] lines().map: {
#     (1..2503).rotor(.words[6] => .words[13]).elems * .words[6] * .words[3];
# }

# Part 2
my @reindeers;
for lines() {
    @reindeers.push: %(
        name => .words[0],
        speed => +.words[3],
        run_time => +.words[6],
        rest_time => +.words[13],
    );
}

my %points;
for 1..2503 -> $time {
    for @reindeers {
        my $cycle_time = .<run_time> + .<rest_time>;
        my $distance = .<speed> * ( ($time div $cycle_time) * .<run_time> + min(.<run_time>, $time % $cycle_time) );
        .<distance>.push: $distance;
    }
    my @leaders = @reindeers.grep: *<distance>[$time-1] == @reindeers.map({.<distance>[$time-1]}).max;
    %points{~.<name>}++ for @leaders;
}
say %points.values.max;