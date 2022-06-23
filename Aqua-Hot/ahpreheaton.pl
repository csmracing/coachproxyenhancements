#!/usr/bin/perl -w

use strict;
no strict 'refs';

my ($prio,$dgnhi,$dgnlo,$srcAD)=(6,'1FE','98',96);

my $binCanId=sprintf("%b0%b%b%b",hex($prio),hex($dgnhi),hex($dgnlo),hex($srcAD));
my $hexCanId=sprintf("%08X",oct("0b$binCanId"));


#Send Pre-heat On Command
system('cansend can0 '.$hexCanId.'#01FFFFDFFFFFFFFF');
print 'cansend can0 '.$hexCanId.'#01FFFFDFFFFFFFFF'."\n";

