#!/usr/bin/env perl6

my Int $paper_sum;
my Int $ribbon_sum;

for lines() {
    my Int (\w, \h, \l) = .split('x')>>.Int.sort;
    $paper_sum += 3*w*h + 2*(h*l + w*l);
    $ribbon_sum += 2*(w + h) + w*h*l;
}

say "Paper: $paper_sum";
say "Ribbon: $ribbon_sum";