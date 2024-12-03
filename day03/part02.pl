#!/usr/bin/perl 

#my $input_file = 'test_input01.txt' ; # 4
# my $input_file = 'test_input02.txt' ; # 8
my $input_file = 'input_mod.txt' ;

my @input ;
my $enable = 1 ;

# load in input
open(FH, '<', $input_file)
    or die $! ;

while(my $input_str = <FH>){
    chomp($input_str) ;

    if ($input_str == 'do'){
        $enable = 1 ;
        next ;
    } elsif ($input_str == "dont") {
        $enable = 0 ;
        next ;
    }


}

close(FH);
exit;
