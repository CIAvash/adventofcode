#!/usr/bin/env perl6

#| Part 1 - Solution 1
multi MAIN ('p1s1', Int $input){
    for 1..* -> $house {
        my $presents = [+] (1..$house).grep($house %% *).map: * * 10;
        "House $house got $presents presents".say and last if $presents >= $input;
    }
}

#| Part 1 - Solution 2
multi MAIN ('p1s2', Int $input){
    my $size = $input/10;
    my int @presents[$size * 2];
    for 1..$size -> $elf {
        for $elf, * + $elf ...^ * > $size -> $house {
            @presents[$house] += $elf * 10;
        }
    }
    my $house = @presents.pairs.grep(*.value >= $input).min;
    say "House {$house.key} got {$house.value} presents";
}

#| Part 2 - Solution 1
multi MAIN ('p2s1', Int $input){
    for 1..* -> $house {
        my $presents = [+] (1..$house).grep($house %% *).map: -> $elf { $elf * 11 if $house/$elf <= 50 }
        "House $house got $presents presents".say and last if $presents >= $input;
    }
}

#| Part 2 - Solution 2
multi MAIN ('p2s2', Int $input){
    my $size = $input/10;
    my int @presents[$size * 2];
    for 1..$size -> $elf {
        for $elf, * + $elf ...^ * > $size -> $house {
            @presents[$house] += $elf * 11;
            last if $house/$elf == 50;
        }
    }
    my $house = @presents.pairs.grep(*.value >= $input).min;
    say "House {$house.key} got {$house.value} presents";
}