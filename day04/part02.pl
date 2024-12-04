#!/usr/bin/perl
#
# solve-wordsearch - search for words (from a word list) in a wordsearch grid
#
use strict;
use warnings;
use v5.20;
use feature       qw/ signatures /;
no warnings       qw/ experimental::signatures /;
use File::Slurper qw/ read_lines /;

die "usage: $0 <grid-file> <word-list>\n" unless @ARGV == 2;

my @grid      = map { [split('',lc($_))] } read_lines($ARGV[0]);
my %is_a_word = map { lc($_) => 1        } read_lines($ARGV[1]);
my $num_cols  = int(@{ $grid[0] });
my $num_rows  = int(@grid);
my %found;
my $count = 0;

# scan_grid_for_words();
scan_diag_for_words();
print_words();

sub scan_grid_for_words {
    for (my $row = 0; $row < $num_rows; ++$row) {
        for (my $col = 0; $col < $num_cols; ++$col) {
            foreach my $row_delta (-1, 0, 1) {
                foreach my $col_delta (-1, 0, 1) {
                    next if $row_delta == 0 && $col_delta == 0;
                    scan_line_for_words($row, $col, $row_delta, $col_delta);
                }
            }
        }
    }
}

sub scan_diag_for_words {
    for (my $row = 0; $row < $num_rows; ++$row) {
        for (my $col = 0; $col < $num_cols; ++$col) {
            scan_line_for_words($row, $col);
        }
    }
}

sub scan_line_for_words ($row, $col) {

    if ($grid[$row][$col] eq 'a') {
        if (on_grid($row, $col) && on_grid($row-1, $col-1) && on_grid($row+1, $col-1) && on_grid($row-1, $col+1) && on_grid($row+1, $col+1) ) {
            # M on bottom, S on top
            if ( ($grid[$row+1][$col+1] eq 'm') && ($grid[$row+1][$col-1] eq 'm') && ($grid[$row-1][$col+1] eq 's') && ($grid[$row-1][$col-1] eq 's') ) {
                $count++;
                printf("(%d,%d) %s\n",$col, $row, $grid[$row][$col]);
            }
            # S on bottom, M on top
            if ( ($grid[$row+1][$col+1] eq 's') && ($grid[$row+1][$col-1] eq 's') && ($grid[$row-1][$col+1] eq 'm') && ($grid[$row-1][$col-1] eq 'm') ) {
                $count++;
                printf("(%d,%d) %s\n",$col, $row, $grid[$row][$col]);
            }
            # M on left, S on right
            if ( ($grid[$row+1][$col+1] eq 's') && ($grid[$row+1][$col-1] eq 'm') && ($grid[$row-1][$col+1] eq 's') && ($grid[$row-1][$col-1] eq 'm') ) {
                $count++;
                printf("(%d,%d) %s\n",$col, $row, $grid[$row][$col]);
            }
            # S on left, M on right
            if ( ($grid[$row+1][$col+1] eq 'm') && ($grid[$row+1][$col-1] eq 's') && ($grid[$row-1][$col+1] eq 'm') && ($grid[$row-1][$col-1] eq 's') ) {
                $count++;
                printf("(%d,%d) %s\n",$col, $row, $grid[$row][$col]);
            }

        }
    }
}

sub on_grid ($row, $col) {
    return ($row < $num_rows && $row >= 0 && $col >= 0 && $col < $num_cols);
}

sub print_words {
    print "$count\n";
}