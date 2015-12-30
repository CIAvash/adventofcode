#!/usr/bin/env perl6

# Part 1
my @replacements = lines();
my $medicine_molecule = @replacements.pop;
@replacements.pop; # Remove newline

my @molecules = @replacements.flatmap: -> $replacement {
    ($medicine_molecule.subst($_, $replacement.words[2], :c(.from)) for $medicine_molecule ~~ m:g/$($replacement.words[0])/);
}
say +@molecules.unique;