#!/usr/bin/perl 

my $input_file = 'test_input01.txt' ; # 4
# my $input_file = 'test_input02.txt' ; # 8
# my $input_file = 'input.txt' ;


# load in input
open(FH, '<', $input_file)
    or die $! ;

my $line_idx = 0 ; 
while(my $input_line = <FH>){
    chomp($input_line) ;

# /mul\((\d{1,3}),(\d{1,3})\)/

    my @getMul = grep { /mul\((\d{1,3}),(\d{1,3})\)/ } $inupt_line ;
    print(@gitMul);


}