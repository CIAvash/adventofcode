#!/usr/bin/env perl6

use Digest::MD5;

sub MAIN (Str $input) {
    my $d5 = Digest::MD5.new;
    for ^Inf {
        if ($d5.md5_hex($input ~ $_).starts-with('00000')) {
            .say;
            last;
        }
    }
}