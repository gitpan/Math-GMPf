use warnings;
use strict;
use Math::GMPf qw(:mpf);
use Math::BigInt; # for some error checks

print "1..3\n";

print "# Using gmp version ", Math::GMPf::gmp_v(), "\n";

open(WR1, '>', 'out1.txt') or die "Can't open WR1: $!";
open(WR2, '>', 'out2.txt') or die "Can't open WR2: $!";

my $mpz = Math::GMPf->new(-1234567);
my $int = -17;
my $ul = 56789;
my $string = "A string";

Rmpf_fprintf(\*WR1, "An mpf object: %.0Ff ", $mpz);

$mpz++;
Rmpf_fprintf(\*WR2, "An mpf object: %.0Ff ", $mpz);

Rmpf_fprintf(\*WR1, "followed by a signed int: %d ", $int);
$int++;
Rmpf_fprintf(\*WR2, "followed by a signed int: %d ", $int);

Rmpf_fprintf(\*WR1, "followed by an unsigned long: %u\n", $ul);
$ul++;
Rmpf_fprintf(\*WR2, "followed by an unsigned long: %u\n", $ul);

Rmpf_fprintf(\*WR1, "%s ", $string);
Rmpf_fprintf(\*WR2, "%s ", $string);

Rmpf_fprintf(\*WR1, "and an mpf object again: %.0Ff\n", $mpz);
$mpz++;
Rmpf_fprintf(\*WR2, "and an mpf object again: %.0Ff\n", $mpz);

close(WR1) or die "Can't close WR1: $!";
close(WR2) or die "Can't close WR2: $!";
open(RD1, '<', 'out1.txt') or die "Can't open RD1: $!";
open(RD2, '<', 'out2.txt') or die "Can't open RD2: $!";

my $ok;

while(<RD1>) {
     chomp;
     if($. == 1) {
       if($_ eq 'An mpf object: -1234567 followed by a signed int: -17 followed by an unsigned long: 56789') {$ok .= 'a'}
        else {print "1a got: $_\n"}
     }
     if($. == 2) {
       if($_ eq 'A string and an mpf object again: -1234566') {$ok .= 'b'}
        else {print "1b got: $_\n"}
     }
}

while(<RD2>) {
     chomp;
     if($. == 1) {
       if($_ eq 'An mpf object: -1234566 followed by a signed int: -16 followed by an unsigned long: 56790') {$ok .= 'c'}
        else {print "1c got: $_\n"}
     }
     if($. == 2) {
       if($_ eq 'A string and an mpf object again: -1234565') {$ok .= 'd'}
        else {print "1d got: $_\n"}
     }
}

close(RD1) or die "Can't close RD1: $!";
close(RD2) or die "Can't close RD2: $!";

if($ok eq 'abcd') {print "ok 1\n"}
else {print "not ok 1 $ok\n"}

$ok = '';
my $buffer = 'XOXO' x 10;
my $buf = $buffer;

Rmpf_sprintf($buf, "The mpf object: %.0Ff", $mpz);
if ($buf eq 'The mpf object: -1234565') {$ok .= 'a'}
else {print "2a got: $buf\n"}

$buf = $buffer;
$mpz *= -1;

my $ret = Rmpf_sprintf_ret($buf, "The mpf object: %.0Ff", $mpz);
if ($ret eq 'The mpf object: 1234565') {$ok .= 'b'}
else {print "2b got: $ret\n"}
if ($buf eq 'The mpf object: 1234565' . "\0" . 'XOXO' x 4) {$ok .= 'c'}
else {print "2c got: $buf\n"}

$buf = $buffer;
my $zeroes = 3;

Rmpf_sprintf($buf, "The mpf object: %.${zeroes}Ff", $mpz);
if ($buf eq 'The mpf object: 1234565.000') {$ok .= 'd'}
else {print "2d got: $buf\n"}

$buf = $buffer;

$ret = Rmpf_sprintf_ret($buf, "The mpf object: %.${zeroes}Ff", $mpz);
if ($ret eq 'The mpf object: 1234565.000') {$ok .= 'e'}
else {print "2e got: $ret\n"}
if ($buf eq 'The mpf object: 1234565.000' . "\0" . 'XOXO' x 3) {$ok .= 'f'}
else {print "2f got: $buf\n"}


if($ok eq 'abcdef') {print "ok 2\n"}
else {print "not ok 2 $ok\n"}

$ok = '';

my $mbi = Math::BigInt->new(123);
eval {Rmpf_printf("%.0Ff", $mbi);};
if($@ =~ /Unrecognised object/) {$ok .= 'a'}
else {print "3a got: $@\n"}

eval {Rmpf_fprintf(\*STDOUT, "%.0Ff", $mbi);};
if($@ =~ /Unrecognised object/) {$ok .= 'b'}
else {print "3b got: $@\n"}

eval {Rmpf_sprintf($buf, "%.0Ff", $mbi);};
if($@ =~ /Unrecognised object/) {$ok .= 'c'}
else {print "3c got: $@\n"}

eval {Rmpf_sprintf_ret($buf, "%.0Ff", $mbi);};
if($@ =~ /Unrecognised object/) {$ok .= 'd'}
else {print "3d got: $@\n"}

eval {Rmpf_fprintf(\*STDOUT, "%.0Ff", $mbi, $ul);};
if($@ =~ /must take 3 arguments/) {$ok .= 'e'}
else {print "3e got: $@\n"}

eval {Rmpf_sprintf($buf, "%.0Ff", $mbi, $ul);};
if($@ =~ /must take 3 arguments/) {$ok .= 'f'}
else {print "3f got: $@\n"}

eval {Rmpf_sprintf_ret("%.0Ff", $mbi);};
if($@ =~ /must take 3 arguments/) {$ok .= 'g'}
else {print "3g got: $@\n"}

if($ok eq 'abcdefg') {print "ok 3\n"}
else {print "not ok 3 $ok\n"}

$ok = '';

