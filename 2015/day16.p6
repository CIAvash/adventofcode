#!/usr/bin/env perl6

my %target = (
    :children(3),
    :samoyeds(2),
    :akitas(0),
    :vizslas(0),
    :cars(2),
    :perfumes(1),
    :cats(7),
    :trees(3),
    :pomeranians(3),
    :goldfish(5),
    # Part 2
    # :cats(7..*),
    # :trees(3..*),
    # :pomeranians(0..3),
    # :goldfish(0..5),
);

my %aunts;
for lines() {
    m:g/(Sue\s\d+) .*? [(\w+) .*? (\d+) [','\s]?]+/;
    %aunts{$/[0;0]}{.[0]} = +.[1] for $/[0;1] Z $/[0;2];
}

my %item_weight;
for %aunts -> %aunt {
    for %target -> %item {
        (%item_weight{%aunt.key}++ if $_ ~~ %item.value) with %aunt.value{%item.key};
    }
}

say %item_weight.invert.max.value;