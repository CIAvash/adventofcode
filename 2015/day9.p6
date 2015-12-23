#!/usr/bin/env perl6

my %distances;

for lines() {
    /(\w+) \s to \s (\w+) \s '=' \s (\d+)/;
    (%distances{$0}{$1}, %distances{$1}{$0}) = +$2 xx 2;
}

my @distances = %distances.keys.permutations.map: -> @countries {
    [+] (%distances{@countries[$_]}{@countries[$_+1]} for 0 .. @countries-2);
}

say "Shortest: @distances.min(), Longest: @distances.max()";