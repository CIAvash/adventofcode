#!/usr/bin/env perl6

use experimental :cached;

my grammar instructions {
    token TOP { <line>+ }
    rule line { [<binary> | <unary> | <operand>] '->' $<result>=\w+ }
    rule binary { $<left_operand>=<operand> $<operator>=\w+ $<right_operand>=<operand> }
    rule unary { $<operator>=\w+ <operand> }
    token operand { \w+ | <number> }
    token number { \d+ }
}

my $match = instructions.parse($*ARGFILES.slurp);

my %operators = (
    AND => &infix:<+&>,
    OR => &infix:<+|>,
    LSHIFT => &infix:<< +< >>,
    RSHIFT => &infix:<< +> >>,
    NOT => &prefix:<+^>,
);

sub calculate ($target) is cached {
    return +$target if $target ~~ /\d+/;

    my $m = $match<line>.grep(*<result>.Str eq $target)[0];

    if $m<operand> {
        calculate($m<operand>)
    }
    elsif $m<binary> {
        %operators{$m<binary><operator>}(calculate($m<binary><left_operand>), calculate($m<binary><right_operand>));
    }
    elsif $m<unary> {
        %operators{$m<unary><operator>}(calculate($m<unary><operand>)) % 2**16;
    }
}

my $signal = calculate('a');
say "a: $signal";

# Part 2
# my $file = $*ARGFILES.slurp;
# say 'Rewiring';
# $file ~~ s/^^\d+ ' -> b' $$/$signal -> b/;
# $match = instructions.parse($file);
# say 'Rewired a: ' ~ calculate('a');