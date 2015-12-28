#!/usr/bin/env perl6

# Part 1
# say +lines().combinations.grep: *.sum == 150;

# Part 2
say +.cache.grep(.min) with lines().combinations.grep(*.sum == 150).map(*.elems);