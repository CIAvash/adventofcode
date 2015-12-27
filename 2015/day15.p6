#!/usr/bin/env perl6

my %ingredients;
for lines() -> $_ is copy {
    s:g/','//;
    %ingredients{.words[0]} = %(
        capacity => +.words[2],
        durability => +.words[4],
        flavor => +.words[6],
        texture => +.words[8],
        calories => +.words[10],
    );
}

my @properties = %ingredients.values[0].keys.sort.grep: * !eq 'calories';

my @teaspoon_combo = ([X] (1..^100) xx +%ingredients).grep: *.sum == 100;

say [max] @teaspoon_combo.map: -> @teaspoons {
    # If condition is for part 2
    if (@teaspoons Z* %ingredients.values>><calories>).sum == 500 {
        [*] @properties.map: -> $property {
            my $sum = [+] @teaspoons Z* %ingredients.values>>{$property};
            $sum < 0 ?? 0 !! $sum;
        }
    }
}