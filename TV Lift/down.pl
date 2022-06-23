#!/usr/bin/perl -w

use strict;
no strict 'refs';

my ($prio,$dgnhi,$dgnlo,$srcAD)=(6,'1FE','E1',96);

my $binCanId=sprintf("%b0%b%b%b",hex($prio),hex($dgnhi),hex($dgnlo),hex($srcAD));
my $hexCanId=sprintf("%08X",oct("0b$binCanId"));

#Ensure Up is off
system('cansend can0 19FEDB96#2BFFC8030000FFFF');
print 'cansend can0 19FEDB96#2BFFC8030000FFFF'."\n";

#Ensure Down is on
system('cansend can0 19FEDB96#2CFFC8051E00FFFF');
print 'cansend can0 19FEDB96#2CFFC8051E00FFFF'."\n";

#Send the down command for 22 seconds
system('cansend can0 '.$hexCanId.'#01FFC84116FFFFFF');
print 'cansend can0 '.$hexCanId.'#01FFC84116FFFFFF'."\n";

#wait for 23 seconds for the lift to stop moving
sleep(23);

#tell the lift we are done moving
system('cansend can0 '.$hexCanId.'#01FF0004FFFFFFFF');
print 'cansend can0 '.$hexCanId.'#01FF0004FFFFFFFF'."\n";


