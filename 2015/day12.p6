#!/usr/bin/env perl6

# Part 1
# say $*ARGFILES.slurp.match(/'-'?\d+/, :g).sum;

# Part 2
use JSON::Fast;

my %json = from-json($*ARGFILES.slurp);

sub sum ($obj) {
    given $obj {
        when Hash {
            return 0 if $obj.values.grep: * eq 'red';

            my $sum += sum($_) for $obj.values;
            return $sum;
        }
        when Array {
            my $sum += sum($_) for |$obj;
            return $sum;
        }
        when Int {
            return $_;
        }
    }
}

say 'Result: ' ~ sum(%json);