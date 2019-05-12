#!/usr/bin/perl 

use warnings;

print("Password length ?\n");
my $passize = <STDIN>;
my $password;

my @char = (('A'..'Z'), ('a'..'z'), ('!','@','%','^'), (0..9));
my $nchar = $#char + 1;

for(1..$passize) {
        $genpass .= $char[int(rand($nchar))];
}

print "$genpass\n";

