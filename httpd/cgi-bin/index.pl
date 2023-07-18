#!/usr/bin/perl
use strict;
use warnings;

print "Content-Type: text/plain\n\n";

foreach my $key (keys %ENV) {
    print $key . ": " . $ENV{$key} . "\n";
}
