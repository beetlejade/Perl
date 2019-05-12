#!/usr/bin/perl 

# Variables--
#--------------------------------------

my $choice;
my $passize;
my $nchar;
my $genpass;
my $user;
my $path;
my @char = ();


#---------------------------------------

# Choice Function (Yes/No) --
#--------------------------------------

sub choice() {
        my $a = @_;
        chomp(my $input = <STDIN>);

        if ($input =~ /^[Y]?$/i) {
                $a =1;
        }
        elsif ($input =~ /^[N]$/i) {
                $a =0;
        }
        else {
                print("please try again\n");
                choice($a);
        }
}

#--------------------------------------

# Inputs of user's wills. --
#--------------------------------------

print("Password length ?\n");
$passize = <STDIN>;

print "Include Symbols ? ('!','@','%','^') (Y/n)\n";
$choice = choice();
push (@char,'!','@','%','^') if($choice);
print "Include Lowercase Characters ? (Y/n)\n";
$choice = choice();
push (@char,(a..z)) if($choice);
print "Include Uppercase Characters ? (Y/n)\n";
$choice = choice();
push (@char,(A..Z)) if($choice);
print "Include Numbers ?(Y/n)\n";
$choice = choice();
push (@char,(0..9)) if($choice);

#--------------------------------------

#Creating the random password --
#--------------------------------------

$nchar = $#char + 1;

for(1..$passize) {
        $genpass .= $char[int(rand($nchar))];
}

#--------------------------------------

print "$genpass\n";
print "Would you like to save this password ? (Y/n)\n";

$choice = choice();
chomp($user = `whoami`);
$path = "/home/$user/strongpassgen/hash.txt";
if($choice) {
        mkdir "/home/$user/strongpassgen";
        open(my $file, '>>', $path);
        print($file "$genpass\n");
        close($file);
}
