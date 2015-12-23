#!/usr/bin/env perl6

sub MAIN (Str $input) {
    my Int $floor;
    my Int $position;
    for $input.comb {
        $position++;
        when '(' {
            $floor++;
        }
        when ')' {
            $floor--;
            say "Entered basement at $position" if $floor == -1;
        }
    }
    say "Floor: $floor";
}