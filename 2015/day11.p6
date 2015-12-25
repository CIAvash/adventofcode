#!/usr/bin/env perl6

# Solution 1
multi MAIN ('s1', Str $input is copy) {
    my Bool $rule1_flag;
    loop {
        ++$input;
        my @chars = $input.comb;
        my $counter = 0;
        $rule1_flag = False;
        for @chars {
            last if $counter == @chars - 2;
            ++$counter;
            if @chars[$counter] eq ++$_ and @chars[$counter+1] eq ++$_ {
                $rule1_flag = True;
                last;
            }
        }
        last if $rule1_flag and $input !~~ /i|o|l/ and $input ~~ /(\w)$0.*(\w)$1/;
    }
    say $input;
}

# Solution 2 - Eats up memory!
multi MAIN ('s2', $_ is copy) {
    my $rule1 = rx/(\w)<{$0.Str.succ}><{$0.Str.succ.succ}>/;
    repeat {++$_} until $rule1 and !/i|o|l/ and /(\w)$0.*(\w)$1/;
    .say;
}

# Solution 3 - Slow
multi MAIN ('s3', $_ is copy) {
    my @rule1 = ('a'..'z').rotor(3 => -2)>>.join;
    # Same thing with a sequence
    # my @rule1 = 'abc', { .comb[1] ~ .comb[2] ~ .comb[2].succ } ... 'xyz';
    repeat {++$_} until /@rule1/ and !/i|o|l/ and .match(/(\w)$0/, :g).elems >= 2;
    .say;
}