#!/usr/bin/perl 

#my $input_file = 'test_input01.txt' ; # 4
# my $input_file = 'test_input02.txt' ; # 8
my $input_file = 'input.txt' ;

my @map1 ;
my @map2 ;
my $cum_distance = 0 ;
my $sim_score = 0 ; 

# load in input
open(FH, '<', $input_file)
    or die $! ;

# read in file to @map array
my $line_idx = 0 ; 
while(my $input_line = <FH>){
    chomp($input_line) ;
    my ($a, $b) = split(/[\s]+/,$input_line);
    push @map1, $a;
    push @map2, $b;
}
close(FH);

@map1 = sort @map1 ;
@map2 = sort @map2 ;

# dump array
#print "Map1: @map1\n";
#print "Map2: @map2\n";

for(my $key = 0; $key <= $#map1; $key++){
    my $distance =  abs($map1[$key] - $map2[$key]);
    printf("m1: %d\tm2: %d\td: %d\n", $map1[$key], $map2[$key], $distance);
    $cum_distance = $cum_distance + $distance;
}

# find similarity score
# itterate through left list
foreach my $key (@map1){
    print("key: $key ");
    my $count = grep(/$key/, @map2) ;
    print("count: $count\n");
    $sim_score = $sim_score + $count * $key ;
}

print "cum_distance: $cum_distance\n" ;
print "sim_score: $sim_score\n" ;

exit;
