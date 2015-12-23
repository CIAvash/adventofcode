#!/usr/bin/env perl6

multi MAIN (Str $input) {
    my ($x, $y) = 0,0;
    my %houses;
    %houses{$x}{$y} = 1;

    for $input.comb {
        {
            when '^' { $y++; }
            when '>' { $x++; }
            when 'v' { $y--; }
            when '<' { $x--; }
        }
        
        %houses{$x}{$y}++;
    }
    say 'Santa alone: ' ~ [+] %houses>>.elems.values;
}

multi MAIN ('robo', Str $input) {
    my %santas;
    %santas<santa> = { x => 0, y => 0 };
    %santas<robo> = { x => 0, y => 0 };
    my %houses;
    %houses<0><0> = 2;

    my $i = 1;
    for $input.comb {
        my $santa = $i++ %% 2 ?? 'robo' !! 'santa';

        {
            when '^' { %santas{$santa}<y>++; }
            when '>' { %santas{$santa}<x>++; }
            when 'v' { %santas{$santa}<y>--; }
            when '<' { %santas{$santa}<x>--; }
        }
        
        %houses{%santas{$santa}<x>}{%santas{$santa}<y>}++;
    }

    say 'Santa and robo-santa: ' ~ [+] %houses>>.elems.values;
}