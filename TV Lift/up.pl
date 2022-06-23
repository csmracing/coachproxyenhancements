#!/usr/bin/perl -w

use strict;
no strict 'refs';

my ($prio,$dgnhi,$dgnlo,$srcAD)=(6,'1FE','E1',96);

my $binCanId=sprintf("%b0%b%b%b",hex($prio),hex($dgnhi),hex($dgnlo),hex($srcAD));
my $hexCanId=sprintf("%08X",oct("0b$binCanId"));

#Ensure Down is off
system('cansend can0 19FEDB96#2CFFC8030000FFFF');
print 'cansend can0 19FEDB96#2CFFC8030000FFFF'."\n";

#Ensure Up is on
system('cansend can0 19FEDB96#2BFFC8051E00FFFF');
print 'cansend can0 19FEDB96#2BFFC8051E00FFFF'."\n";

#Send move up command for 24 seconds
system('cansend can0 '.$hexCanId.'#01FFC88118FFFFFF');
print 'cansend can0 '.$hexCanId.'#01FFC88118FFFFFF'."\n";

#Wait 25 seconds for command to finish
sleep(25);

#Tell the lift we are done moving
system('cansend can0 '.$hexCanId.'#01FF0004FFFFFFFF');
print 'cansend can0 '.$hexCanId.'#01FF0004FFFFFFFF'."\n";


