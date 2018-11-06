#!/usr/bin/perl

use strict;
use Text::CSV;
use Data::Dumper;

# Try iconv, since there is windows charset in vtb csv files.
# E.g.: cat some.csv |iconv -f CP1251 -t UTF-8 > come_code.csv
my $file = $ARGV[0];
die "Missing file\nUsage: $0 file\n" unless $file;

my @rows;
my $csv = Text::CSV->new ( { binary => 1 } )  # should set binary attribute
    or die "Cannot use CSV: ".Text::CSV->error_diag ();
$csv->sep_char (";");

open my $fh, "<:encoding(utf8)", $file or die "Cant read file $file: $!";

my $total_rub = 0;
my $providers_count = 0;
while ( my $row = $csv->getline( $fh ) ) {
    #print STDOUT join(' ', @{$row}[1,5,7]) . "\n";
    # 2018-07-15 12:22:15 -8 533,80 CODE CLIMATE QUALITY

    $row->[1] =~ /^(\d{4}\-\d{2}\-\d{2})\s+/;
    my $charge_date = $1;

    my $amount_rub = $row->[5];
    $amount_rub =~ s/\s+//;
    $amount_rub =~ s/\-//;
    $amount_rub =~ s/\,/\./;

    $total_rub += $amount_rub;
    $providers_count++;
    
    my $service_name = $row->[7];
    
    warn "$charge_date $amount_rub $service_name\n";
}
$csv->eof or $csv->error_diag();
close $fh;

$csv->eol ("\r\n");

warn "Total: $total_rub ($providers_count providers)\n";
