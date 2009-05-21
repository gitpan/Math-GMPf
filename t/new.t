use warnings;
use strict;
use Math::GMPf qw(:mpf);
use Math::BigInt;
use Config;

print "1..4\n";

print "# Using gmp version ", Math::GMPf::gmp_v(), "\n";

my @version = split /\./, Math::GMPf::gmp_v();
my $old = 0;
if($version[0] == 4 && $version[1] < 2) {$old = 1}
if($old) {warn "Test 1 should fail - GMP version ", Math::GMPf::gmp_v(), " is old and doesn't support base 62\n";}

Rmpf_set_default_prec(64);

my $ui = 123569;
my $si = -19907;
my $d = -1.625;
my $str = '-119.125';
my $str62 = 'zxfy@0';
my $strn = '12@1';

my $ok = '';

my $f000 = Math::GMPf->new($str62, 62);
if($f000 == 14767406) {$ok .= 'a'}

my $f00 = new Math::GMPf();
Rmpf_set_ui($f00, $ui);
if($f00 == $ui) {$ok .= 'b'}

my $f01 = new Math::GMPf($ui);
if($f01 == $ui) {$ok .= 'c'}

my $f02 = new Math::GMPf($si);
if($f02 == $si) {$ok .= 'd'}

my $f03 = new Math::GMPf($d);
if($f03 == $d) {$ok .= 'e'}

my $f04 = new Math::GMPf($str);
if($f04 == $str) {$ok .= 'f'}

my $f05 = new Math::GMPf($str, 10);
if($f05 == $str) {$ok .= 'g'}

my $f06 = new Math::GMPf($d);
if($f06 == $d) {$ok .= 'h'}

my $f07 = Math::GMPf->new($strn, -37);
if($f07 == 1443 ){$ok .= 'i'}

if($ok eq 'abcdefghi') {print "ok 1\n"}
else {print "not ok 1 $ok\n"}

#############################


$ok = '';

my $f10 = Math::GMPf::new();
Rmpf_set_ui($f10, $ui);
if($f10 == $ui) {$ok .= 'b'}

my $f11 = Math::GMPf::new($ui);
if($f11 == $ui) {$ok .= 'c'}

my $f12 = Math::GMPf::new($si);
if($f12 == $si) {$ok .= 'd'}

my $f13 = Math::GMPf::new($d);
if($f13 == $d) {$ok .= 'e'}

my $f14 = Math::GMPf::new($str);
if($f14 == $str) {$ok .= 'f'}

my $f15 = Math::GMPf::new($str, 10);
if($f15 == $str) {$ok .= 'g'}

my $f16 = Math::GMPf::new($d);
if($f16 == $d) {$ok .= 'h'}

#my $f17 = Math::GMPf::new($f16);
#if($f17 == $d) {$ok .= 'i'}

if($ok eq 'bcdefgh') {print "ok 2\n"}
else {print "not ok 2 $ok\n"}

################################

$ok = '';

my $f20 = Math::GMPf->new();
Rmpf_set_ui($f20, $ui);
if($f20 == $ui) {$ok .= 'b'}

my $f21 = Math::GMPf->new($ui);
if($f21 == $ui) {$ok .= 'c'}

my $f22 = Math::GMPf->new($si);
if($f22 == $si) {$ok .= 'd'}

my $f23 = Math::GMPf->new($d);
if($f23 == $d) {$ok .= 'e'}

my $f24 = Math::GMPf->new($str);
if($f24 == $str) {$ok .= 'f'}

my $f25 = Math::GMPf->new($str, 10);
if($f25 == $str) {$ok .= 'g'}

my $f26 = Math::GMPf->new($d);
if($f26 == $d) {$ok .= 'h'}

Rmpf_set_default_prec(100);
my $f27 = Math::GMPf->new(36028797018964023);
my $f28 = Math::GMPf->new('36028797018964023');

if(defined($Config::Config{use64bitint})) {
  if($f27 == $f28) {$ok .= 'i'}
}
else {
  if($f27 != $f28) {$ok .= 'i'}
}

my $f29 = Math::GMPf->new($f26);
if($f29 == $d) {$ok .= 'j'}

if($ok eq 'bcdefghij') {print "ok 3\n"}
else {print "not ok 3 $ok\n"}

#############################

my $bi = Math::BigInt->new(123456789);

$ok = '';

eval{my $f30 = Math::GMPf->new(17, 12);};
if($@ =~ /Too many arguments supplied to new\(\) \- expected only one/) {$ok = 'a'}

eval{my $f31 = Math::GMPf::new(17, 12);};
if($@ =~ /Too many arguments supplied to new\(\) \- expected only one/) {$ok .= 'b'}

eval{my $f32 = Math::GMPf->new($str, 12, 7);};
if($@ =~ /Too many arguments supplied to new\(\)/) {$ok .= 'c'}

eval{my $f33 = Math::GMPf::new($str, 12, 7);};
if($@ =~ /Too many arguments supplied to new\(\) \- expected no more than two/) {$ok .= 'd'}

eval{my $f34 = Math::GMPf->new($bi);};
if($@ =~ /Inappropriate argument/) {$ok .= 'e'}

eval{my $f35 = Math::GMPf::new($bi);};
if($@ =~ /Inappropriate argument/) {$ok .= 'f'}

eval{my $f36 = Math::GMPf->new($f27, 10);};
if($@ =~ /Too many arguments supplied to new\(\) \- expected only one/) {$ok .= 'g'}

eval{my $f37 = Math::GMPf::new($f27, 10);};
if($@ =~ /Too many arguments supplied to new\(\) \- expected only one/) {$ok .= 'h'}

eval{my $f38 = Math::GMPf::new('123.abc');};
if($@ =~ /is not a valid base 10 number/) {$ok .= 'i'}

eval{my $f39 = Math::GMPf->new('123.abc');};
if($@ =~ /is not a valid base 10 number/) {$ok .= 'j'}

eval{my $f40 = Math::GMPf::new('123.abc', 8);};
if($@ =~ /is not a valid base 8 number/) {$ok .= 'k'}

eval{my $f41 = Math::GMPf->new('123.abc', 8);};
if($@ =~ /is not a valid base 8 number/) {$ok .= 'l'}

if($ok eq 'abcdefghijkl') {print "ok 4\n"}
else {print "not ok 4 $ok\n"}

