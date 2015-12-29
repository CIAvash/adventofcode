#!/usr/bin/env perl6

my $grid = 100;
my @lights[$grid+2;$grid+2];
for lines().kv -> $i, $line {
    for $line.comb.kv -> $j, $char {
        @lights[$i+1;$j+1] = $char;
    }
}

my @old_lights[$grid+2;$grid+2];
for ^100 {
    @old_lights = @lights.clone;
    for [X] (1..$grid) xx 2 -> [$i, $j] {
        # Part 2
        # next if ($i, $j) ~~ (1, 1)|(1, $grid)|($grid, 1)|($grid, $grid);

        given @lights[$i;$j] {
            when '#' { $_ = '.' unless lit_neighbors($i, $j) == 2|3; }
            when '.' { $_ = '#' if lit_neighbors($i, $j) == 3; }
        }
    }
}

say @lights.grep('#').elems;

sub lit_neighbors ($x, $y) returns Int {
    my $count = 0;
    for $x-1..$x+1 X $y-1..$y+1 -> [$i, $j] {
        next if ($i, $j) ~~ ($x, $y);
        $count++ if @old_lights[$i;$j].gist eq '#';
    }
    $count;
}