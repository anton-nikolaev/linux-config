#!/usr/bin/perl

use strict;
use Data::Dumper;

while (<>) {
    next unless /^([\d\,KGM]+)\s+(.*)$/;
    my $size = $1;
    my $object = $2;
    next unless $size =~ /\w$/;
    next if $size =~ /K$/; # drop smaller than 1M
    next if $size =~ /^\d+$/; # drop smaller than 1K
    next if $size == 0; # drop zero sized
    $size =~ s/\,/./; # help perl understand this as a number
    $size *= 1024 if $size =~ /G$/; # convert gigabytes to megabytes
    $size =~ s/M$//; # chop off megabytes char
    next unless $size > 100; # drop smaller than 100M
    print STDOUT "$size $object\n";
}
