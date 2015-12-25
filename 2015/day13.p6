#!/usr/bin/env perl6

my %guests;
for lines() -> $_ is copy {
    s/lose\s/-/;
    /(\w+).+\s('-'?\d+).+\s(\w+)/;
    %guests{$0}{$2} = +$1;
}

say [max] %guests.keys.permutations.map: -> @guests is copy {
    [+] (@guests.push(@guests[0])).rotor(2 => -1).map: -> [$a, $b] {
        %guests{$a}{$b} + %guests{$b}{$a}
    }
}