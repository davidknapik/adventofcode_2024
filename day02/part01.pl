#!/usr/bin/perl 

my $input_file = 'test_input01.txt' ; # 4
# my $input_file = 'test_input02.txt' ; # 8
# my $input_file = 'input.txt' ;

my @input ;
my $safe_count = 0 ;

# load in input
open(FH, '<', $input_file)
    or die $! ;


# read in file to @map array
while(my $input_str = <FH>){
    chomp($input_str) ;
    @input_arr = split(' ', $input_str);

    my $i0 = -1 ;
    my $safe = 1 ;
    my $array_dir = -1 ;
    my $pd = 0 ;


    #
    # Test for all increasing/all decreasing
    #
    if ($input_arr[1] > $input_arr[0] ) {
        #input is assending
        $array_dir = 1 ;
    } elsif ($input_arr[1] < $input_arr[0]) {
        # array is desending
        $array_dir = 0 ; 
    } else {
        # if first two elements happen to be equal, then not safe anyway
        $array_dir = -1 ; 
        $safe = 0 ;
    }


    print("A1: @input_arr\n");
    print("array_dir: $array_dir\n");

    #
    # Check if element delta is out of bounds
    #
    foreach my $key (@input_arr){
        # grab the first element
        if ($i0 == -1 ) {
            $i0 = $key ;
            next;
        }

        # Test for direction change
        if ($i0 > $key &&  $array_dir == 1 ) {
            # deteted direction change assending to descening
            $safe = 0 ;
            $pd++;
        } elsif ( $i0 > $key && $array_dir == 0 ) {
            # still descenging (good)
        } elsif ($i0 < $key && $array_dir == 1) {
            # still assending (good)
        } elsif ( $i0 < $key && $array_dir == 0) {
            # deteted direction change descending to assending
            $safe = 0 ;
            $pd++;
        } elsif ( $i0 == $key ) {
            # detected same number twice
            $safe = 0 ; 
            $pd++;
        }

        # Test for delta too big
        if (abs($i0 - $key) ge 4){
            $safe = 0 ;
            $pd++;
        }

        printf("%d\t%d\t%d\t%d\t%d\n",$i0, $key, abs($i0-$key), $pd, $safe);

        $i0 = $key;

    }
    print("safe: $safe\n\n");

    if ($safe == 1){
        $safe_count++;
    }

}

print("safe count: $safe_count\n");


exit;
