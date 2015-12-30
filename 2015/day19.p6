#!/usr/bin/env perl6

my @replacements = lines();
my $medicine_molecule = @replacements.pop;
@replacements.pop; # Remove empty line

# Part 1
my @molecules = @replacements.flatmap: -> $replacement {
    ($medicine_molecule.subst($_, $replacement.words[2], :c(.from)) for $medicine_molecule ~~ m:g/$($replacement.words[0])/);
}
say +@molecules.unique;

# Part 2
$medicine_molecule.=flip;
my %replacements = @replacements.map(*.flip.words[0,2].hash);
my $count;
$count++ while $medicine_molecule ~~ s/(|| @(%replacements.keys))/%replacements{$0}/;
say $count;