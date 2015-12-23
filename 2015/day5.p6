#!/usr/bin/env perl6

my $nice_count = 0;
# Part 1
# $nice_count++ if .match(/<[aeiou]>/, :g).elems >= 3 and /(\w)$0/ and !/ab|cd|pq|xy/ for lines();
# Part 2
$nice_count++ if /(\w\w)\w*$0/ and /(\w)\w$0/ for lines();
say "Nice: $nice_count";