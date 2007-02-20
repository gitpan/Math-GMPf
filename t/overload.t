use strict;
use warnings;
use Math::GMPf qw(:mpf);
use Math::BigInt; # for some error checking

print "1..40\n";

Rmpf_set_default_prec(200);

my $p = Rmpf_init();
my $q = Rmpf_init();

my $ui = (2 ** 31) + 17;
my $negi = -1236;
my $posi = 1238;
my $posd = (2 ** 41) + 11234;
my $negd = -((2 ** 43) - 111);
my $frac = 23.124901;

Rmpf_set_ui($p, 1234);
Rmpf_set_si($q, -5678);

my $ok = '';

my $z = $p * $q;
if(Rmpf_get_str($z, 10,0) eq '-.7006652@7'
   && $z == -7006652
   && "$z" eq '-.7006652@7') {$ok = 'a'}

$z = $p * $ui;
if(Rmpf_get_str($z, 10, 0) eq '.264999484261@13'
   && $z == 2649994842610
   && "$z" eq '.264999484261@13') {$ok .= 'b'}

$z = $p * $negi;
if(Rmpf_get_str($z, 10, 0) eq '-.1525224@7'
   && $z == -1525224
   && "$z" eq '-.1525224@7') {$ok .= 'c'}

$z = $p * $posd;
if(Rmpf_get_str($z, 10, 0) eq '.2713594711213924@16'
   && $z == 2713594711213924
   && "$z" eq '.2713594711213924@16') {$ok .= 'd'}

$z = $p * $negd;
if(Rmpf_get_str($z, 10, 0) eq '-.10854378789267698@17'
   && $z == -10854378789267698
   && "$z" eq '-.10854378789267698@17') {$ok .= 'e'}

$z = $p * $frac;
if($z > 28536.12783 && $z < 28536.12784) {$ok .= 'f'}

$z = $p * $posi;
if($z == 1527692) {$ok .= 'g'}

if($ok eq 'abcdefg'
   && Math::GMPf::get_refcnt($z) == 1
   && Math::GMPf::get_refcnt($p) == 1
   && Math::GMPf::get_refcnt($q) == 1) {print "ok 1\n"}
else {print "not ok 1 $ok\n"}

$ok = '';

$p *= $q;
if(Rmpf_get_str($p, 10, 0) eq '-.7006652@7'
   && $p == -7006652
   && "$p" eq '-.7006652@7') {$ok = 'a'}
Rmpf_set_ui($p, 1234);

$p *= $ui;
if(Rmpf_get_str($p, 10, 0) eq '.264999484261@13'
   && $p == 2649994842610
   && "$p" eq '.264999484261@13') {$ok .= 'b'}
Rmpf_set_ui($p, 1234);

$p *= $negi;
if(Rmpf_get_str($p, 10, 0) eq '-.1525224@7'
   && $p == -1525224
   && "$p" eq '-.1525224@7') {$ok .= 'c'}
Rmpf_set_ui($p, 1234);

$p *= $posd;
if(Rmpf_get_str($p, 10, 0) eq '.2713594711213924@16'
   && $p == 2713594711213924
   && "$p" eq '.2713594711213924@16') {$ok .= 'd'}
Rmpf_set_ui($p, 1234);

$p *= $negd;
if(Rmpf_get_str($p, 10, 0) eq '-.10854378789267698@17'
   && $p == -10854378789267698
   && "$p" eq '-.10854378789267698@17') {$ok .= 'e'}
Rmpf_set_ui($p, 1234);

$p *= $frac;
if($p > 28536.12783 && $p < 28536.12784) {$ok .= 'f'}
Rmpf_set_ui($p, 1234);

$p *= $posi;
if($p == 1527692) {$ok .= 'g'}
Rmpf_set_ui($p, 1234);

if($ok eq 'abcdefg'
   && Math::GMPf::get_refcnt($p) == 1) {print "ok 2\n"}
else {print "not ok 2 $ok\n"}

$ok = '';

$z = $p + $p;
if(Rmpf_get_str($z, 10, 0) eq '.2468@4'
   && $z == 2468
   && "$z" eq '.2468@4') {$ok = 'a'}

$z = $p + $ui;
if(Rmpf_get_str($z, 10, 0) eq '.2147484899@10'
   && $z == 2147484899
   && "$z" eq '.2147484899@10') {$ok .= 'b'}

$z = $p + $negi;
if(Rmpf_get_str($z, 10, 0) eq '-.2@1'
   && $z == -2
   && "$z" eq '-.2@1') {$ok .= 'c'}

$z = $p + $posd;
if(Rmpf_get_str($z, 10, 0) eq '.219902326802@13'
   && $z == 2199023268020
   && "$z" eq '.219902326802@13') {$ok .= 'd'}

$z = $p + $negd;
if(Rmpf_get_str($z, 10, 0) eq '-.8796093020863@13'
   && $z == -8796093020863
   && "$z" eq '-.8796093020863@13') {$ok .= 'e'}

$z = $p + $frac;
if($z > 1257.1249 && $z < 1257.124902) {$ok .= 'f'}

$z = $p + $posi;
if($z == 2472) {$ok .= 'g'}

if($ok eq 'abcdefg'
   && Math::GMPf::get_refcnt($p) == 1
   && Math::GMPf::get_refcnt($z) == 1) {print "ok 3\n"}
else {print "not ok 3 $ok\n"}

$ok = '';

$p += $p;
if(Rmpf_get_str($p, 10, 0) eq '.2468@4'
   && $p == 2468
   && "$p" eq '.2468@4') {$ok = 'a'}
Rmpf_set_ui($p, 1234);

$p += $ui;
if(Rmpf_get_str($p, 10, 0) eq '.2147484899@10'
   && $p == 2147484899
   && "$p" eq '.2147484899@10') {$ok .= 'b'}
Rmpf_set_ui($p, 1234);

$p += $negi;
if(Rmpf_get_str($p, 10, 0) eq '-.2@1'
   && $p == -2
   && "$p" eq '-.2@1') {$ok .= 'c'}
Rmpf_set_ui($p, 1234);

$p += $posd;
if(Rmpf_get_str($p, 10, 0) eq '.219902326802@13'
   && $p == 2199023268020
   && "$p" eq '.219902326802@13') {$ok .= 'd'}
Rmpf_set_ui($p, 1234);

$p += $negd;
if(Rmpf_get_str($p, 10, 0) eq '-.8796093020863@13'
   && $p == -8796093020863
   && "$p" eq '-.8796093020863@13') {$ok .= 'e'}
Rmpf_set_ui($p, 1234);

$p += $frac;
if($p > 1257.1249 && $p < 1257.124902) {$ok .= 'f'}
Rmpf_set_ui($p, 1234);

$p += $posi;
if($p == 2472) {$ok .= 'g'}
Rmpf_set_ui($p, 1234);

if($ok eq 'abcdefg'
   && Math::GMPf::get_refcnt($p) == 1) {print "ok 4\n"}
else {print "not ok 4 $ok\n"}

$ok = '';

$z = $p / $q;
if($z > -0.2174 && $z < -0.2173) {$ok = 'a'}

$z *= $q / $p;
if($z > 0.999 && $z < 1.001) {$ok .= '1'}

$z = $p / $ui;
if($z > 5.7462e-7 && $z < 5.7463e-7) {$ok .= 'b'}

$z *= $ui / $p;
if($z > 0.999 && $z < 1.001) {$ok .= '2'}

$z = $p / $negi;
if($z > -0.998382 && $z < -0.998381) {$ok .= 'c'}

$z *= $negi / $p;
if($z > 0.999 && $z < 1.001) {$ok .= '3'}

$z = $p / $posd;
if($z > 5.6115822e-10  && $z < 5.6115823e-10  ) {$ok .= 'd'}

$z *= $posd / $p;
if($z > 0.999 && $z < 1.001) {$ok .= '4'}

$z = $p / $negd;
if($z > -1.402896e-10  && $z < -1.402895e-10  ) {$ok .= 'e'}

$z *= $negd / $p;
if($z > 0.999 && $z < 1.001) {$ok .= '5'}

$z = $p / $frac;
if($z > 53.36239  && $z < 53.362391  ) {$ok .= 'f'}

$z *= $frac / $p;
if($z > 0.999 && $z < 1.001) {$ok .= '6'}

$z = $p / $posi;
if($z > 0.9967  && $z < 0.9968  ) {$ok .= 'g'}

$z *= $posi / $p;
if($z > 0.999 && $z < 1.001) {$ok .= '7'}

if($ok eq 'a1b2c3d4e5f6g7'
   && Math::GMPf::get_refcnt($p) == 1
   && Math::GMPf::get_refcnt($z) == 1) {print "ok 5\n"}
else {print "not ok 5 $ok\n"}

$ok = '';

$p *= $ui;
$p /= $ui;
if($p < 1234.0001 && $p > 1233.9999) {$ok = 'a'}

$p *= $negi;
$p /= $negi;
if($p < 1234.0001 && $p > 1233.9999) {$ok .= 'b'}

$p *= $posd;
$p /= $posd;
if($p < 1234.0001 && $p > 1233.9999) {$ok .= 'c'}

$p *= $negd;
$p /= $negd;
if($p < 1234.0001 && $p > 1233.9999) {$ok .= 'd'}

$p *= $frac;
$p /= $frac;
if($p < 1234.0001 && $p > 1233.9999) {$ok .= 'e'}

$p *= $q;
$p /= $q;
if($p < 1234.0001 && $p > 1233.9999) {$ok .= 'f'}

$p *= $posi;
$p /= $posi;
if($p < 1234.0001 && $p > 1233.9999) {$ok .= 'g'}

if($ok eq 'abcdefg'
   && Math::GMPf::get_refcnt($p) == 1) {print "ok 6\n"}
else {print "not ok 6 $ok\n"}

my $c = $p;
if("$c" eq '.1234@4'
   && "$c" eq "$p"
   && $c == $p
   && $c != $q
   && Math::GMPf::get_refcnt($p) == 1
   && Math::GMPf::get_refcnt($c) == 1
   && Math::GMPf::get_refcnt($q) == 1) {print "ok 7\n"}
else {print "not ok 7\n"}

$c *= -1;
if(Rmpf_get_str(abs($c), 10, 0) eq '.1234@4'
   && Math::GMPf::get_refcnt($c) == 1) {print "ok 8\n"}
else {print "not ok 8\n"}

$ok = ($p!=$ui).($p==$ui).($p>$ui).($p>=$ui).($p<$ui).($p<=$ui).($p<=>$ui);
if($ok eq '100011-1') {print "ok 9\n"}
else {print "not ok 9\n"}

$ok = ($p!=$negi).($p==$negi).($p>$negi).($p>=$negi).($p<$negi).($p<=$negi).($p<=>$negi);
if($ok eq '1011001') {print "ok 10\n"}
else {print "not ok 10\n"}

$ok = ($p!=$posd).($p==$posd).($p>$posd).($p>=$posd).($p<$posd).($p<=$posd).($p<=>$posd);
if($ok eq '100011-1') {print "ok 11\n"}
else {print "not ok 11\n"}

$ok = ($p!=$negd).($p==$negd).($p>$negd).($p>=$negd).($p<$negd).($p<=$negd).($p<=>$negd);
if($ok eq '1011001') {print "ok 12\n"}
else {print "not ok 12\n"}

$ok = ($p!=$frac).($p==$frac).($p>$frac).($p>=$frac).($p<$frac).($p<=$frac).($p<=>$frac);
if($ok eq '1011001') {print "ok 13\n"}
else {print "not ok 13\n"}

$ok = ($ui!=$p).($ui==$p).($ui>$p).($ui>=$p).($ui<$p).($ui<=$p).($ui<=>$p);
if($ok eq '1011001') {print "ok 14\n"}
else {print "not ok 14\n"}

$ok = ($negi!=$p).($negi==$p).($negi>$p).($negi>=$p).($negi<$p).($negi<=$p).($negi<=>$p);
if($ok eq '100011-1') {print "ok 15\n"}
else {print "not ok 15\n"}

$ok = ($posd!=$p).($posd==$p).($posd>$p).($posd>=$p).($posd<$p).($posd<=$p).($posd<=>$p);
if($ok eq '1011001') {print "ok 16\n"}
else {print "not ok 16\n"}

$ok = ($negd!=$p).($negd==$p).($negd>$p).($negd>=$p).($negd<$p).($negd<=$p).($negd<=>$p);
if($ok eq '100011-1') {print "ok 17\n"}
else {print "not ok 17\n"}

$ok = ($frac!=$p).($frac==$p).($frac>$p).($frac>=$p).($frac<$p).($frac<=$p).($frac<=>$p);
if($ok eq '100011-1'
   && Math::GMPf::get_refcnt($p) == 1) {print "ok 18\n"}
else {print "not ok 18\n"}

Rmpf_set_ui($q, 0);

if($p && Math::GMPf::get_refcnt($p) == 1) {print "ok 19\n"}
else {print "not ok 19\n"}

if(!$q && Math::GMPf::get_refcnt($q) == 1) {print "ok 20\n"}
else {print "not ok 20\n"}

if(not($q) && Math::GMPf::get_refcnt($q) == 1) {print "ok 21\n"}
else {print "not ok 21\n"}

unless($q || Math::GMPf::get_refcnt($q) != 1) {print "ok 22\n"}
else {print "not ok 22\n"}

$z = $c;
$z *= -1;
if($z == -$c
   && Math::GMPf::get_refcnt($z) == 1
   && Math::GMPf::get_refcnt($c) == 1) {print "ok 23\n"}
else {print "not ok 23\n"}

$ok = '';

$z = $p - $p;
$z += $p;
if($z == $p) {$ok = 'a'}

$z = $p - $ui;
$z += $ui;
if($z == $p) {$ok .= 'b'}

$z = $p - $negi;
$z += $negi;
if($z == $p) {$ok .= 'c'}

$z = $p - $negd;
$z += $negd;
if($z == $p) {$ok .= 'd'}

$z = $p - $posd;
$z += $posd;
if($z == $p) {$ok .= 'e'}

$z = $p - $frac;
$z += $frac;
if($z == $p) {$ok .= 'f'}

$z = $p - $posi;
$z += $posi;
if($z == $p) {$ok .= 'g'}

if($ok eq 'abcdefg'
   && Math::GMPf::get_refcnt($z) == 1
   && Math::GMPf::get_refcnt($p) == 1) {print "ok 24\n"}
else {print "not ok 24 $ok\n"}

$ok = '';

$z = $p + $p;
$z -= $p;
if($z == $p) {$ok = 'a'}

$z = $p + $ui;
$z -= $ui;
if($z == $p) {$ok .= 'b'}

$z = $p + $negi;
$z -= $negi;
if($z == $p) {$ok .= 'c'}

$z = $p + $negd;
$z -= $negd;
if($z == $p) {$ok .= 'd'}

$z = $p + $posd;
$z -= $posd;
if($z == $p) {$ok .= 'e'}

$z = $p + $frac;
$z -= $frac;
if($z == $p) {$ok .= 'f'}

$z = $p + $posi;
$z -= $posi;
if($z == $p) {$ok .= 'g'}

if($ok eq 'abcdefg'
   && Math::GMPf::get_refcnt($z) == 1
   && Math::GMPf::get_refcnt($p) == 1) {print "ok 25\n"}
else {print "not ok 25 $ok\n"}

$ok = '';

$z = $p - $p;
$z += $p;
if($z == $p) {$ok = 'a'}

$z = $ui - $p;
$z -= $ui;
if($z == -$p) {$ok .= 'b'}

$z = $negi - $p;
$z -= $negi;
if($z == -$p) {$ok .= 'c'}

$z = $negd - $p;
$z -= $negd;
if($z == -$p) {$ok .= 'd'}

$z = $posd - $p;
$z -= $posd;
if($z == -$p) {$ok .= 'e'}

$z = $frac - $p;
$z -= $frac;
if($z == -$p) {$ok .= 'f'}

$z = $posi - $p;
$z -= $posi;
if($z == -$p) {$ok .= 'g'}

if($ok eq 'abcdefg'
   && Math::GMPf::get_refcnt($z) == 1
   && Math::GMPf::get_refcnt($p) == 1) {print "ok 26\n"}
else {print "not ok 26 $ok\n"}

$ok = '';

$z = $p + $p;
$z -= $p;
if($z == $p) {$ok = 'a'}

$z = $ui + $p;
$z -= $ui;
if($z == $p) {$ok .= 'b'}

$z = $negi + $p;
$z -= $negi;
if($z == $p) {$ok .= 'c'}

$z = $negd + $p;
$z -= $negd;
if($z == $p) {$ok .= 'd'}

$z = $posd + $p;
$z -= $posd;
if($z == $p) {$ok .= 'e'}

$z = $frac + $p;
$z -= $frac;
if($z == $p) {$ok .= 'f'}

$z = $posi + $p;
$z -= $posi;
if($z == $p) {$ok .= 'g'}

if($ok eq 'abcdefg'
   && Math::GMPf::get_refcnt($z) == 1
   && Math::GMPf::get_refcnt($p) == 1) {print "ok 27\n"}
else {print "not ok 27 $ok\n"}

$ok = ($posi!=$p).($posi==$p).($posi>$p).($posi>=$p).($posi<$p).($posi<=$p).($posi<=>$p);
if($ok eq '1011001'
   && Math::GMPf::get_refcnt($p) == 1) {print "ok 28\n"}
else {print "not ok 28\n"}

$ok = ($p!=$posi).($p==$posi).($p>$posi).($p>=$posi).($p<$posi).($p<=$posi).($p<=>$posi);
if($ok eq '100011-1') {print "ok 29\n"}
else {print "not ok 29\n"}

Rmpf_set_ui($z, 2);

my $root = sqrt($z);
if($root > 1.414 && $root < 1.415
   && Math::GMPf::get_refcnt($z) == 1
   && Math::GMPf::get_refcnt($root) == 1) {print "ok 30\n"}
else {print "not ok 30\n"}

my $root_copy = $root;

$root = $root ** 2;
$root_copy **= 2;

if($root_copy > 1.99999 && $root_copy < 2.00000001
   && $root > 1.99999 && $root < 2.00000001
   && Math::GMPf::get_refcnt($root) == 1
   && Math::GMPf::get_refcnt($root_copy) == 1) {print "ok 31\n"}
else {print "not ok 31\n"}


if($] >= 5.008) {
  Rmpf_set_d($z, 2.11115);

  $root = int($z);
  if($z > 2.1111 && $z < 2.1112
     && $root == 2
     && int($z) == 2
     && Math::GMPf::get_refcnt($z) == 1
     && Math::GMPf::get_refcnt($root) == 1) {print "ok 32\n"}
  else {print "not ok 32\n"}
  }

else {print "ok 32 - skipped - no overloading of 'int()' on perl $] \n"}

my $mbi = Math::BigInt->new(112345);
$ok = '';

eval{$q = $p + $mbi;};
if($@ =~ /Invalid argument/) {$ok = 'a'}
eval{$q = $p * $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'b'}
eval{$q = $p - $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'c'}
eval{$q = $p / $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'd'}
eval{$q = $p ** $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'e'}
eval{$p += $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'f'}
eval{$p *= $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'g'}
eval{$p -= $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'h'}
eval{$p /= $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'i'}
eval{$p **= $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'j'}

if($ok eq 'abcdefghij') {print "ok 33\n"}
else {print "not ok 33 $ok\n"}

$mbi = "this is a string";
$ok = '';

eval{$q = $p + $mbi;};
if($@ =~ /Invalid string/) {$ok = 'a'}
eval{$q = $p * $mbi;};
if($@ =~ /Invalid string/) {$ok .= 'b'}
eval{$q = $p - $mbi;};
if($@ =~ /Invalid string/) {$ok .= 'c'}
eval{$q = $p / $mbi;};
if($@ =~ /Invalid string/) {$ok .= 'd'}
eval{$q = $p ** $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'e'}
eval{$p += $mbi;};
if($@ =~ /Invalid string/) {$ok .= 'f'}
eval{$p *= $mbi;};
if($@ =~ /Invalid string/) {$ok .= 'g'}
eval{$p -= $mbi;};
if($@ =~ /Invalid string/) {$ok .= 'h'}
eval{$p /= $mbi;};
if($@ =~ /Invalid string/) {$ok .= 'i'}
eval{$p **= $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'j'}
eval{if($p > $mbi){};};
if($@ =~ /Invalid string/) {$ok .= 'k'}
eval{if($p < $mbi){};};
if($@ =~ /Invalid string/) {$ok .= 'l'}
eval{if($p >= $mbi){};};
if($@ =~ /Invalid string/) {$ok .= 'm'}
eval{if($p <= $mbi){};};
if($@ =~ /Invalid string/) {$ok .= 'n'}
eval{if($p <=> $mbi){};};
if($@ =~ /Invalid string/) {$ok .= 'o'}
eval{if($p == $mbi){};};
if($@ =~ /Invalid string/) {$ok .= 'p'}
eval{if($p != $mbi){};};
if($@ =~ /Invalid string/) {$ok .= 'q'}

if($ok eq 'abcdefghijklmnopq') {print "ok 34\n"}
else {print "not ok 34 $ok\n"}

$mbi = "-111111111111112.34567879";

$q = $p + $mbi;
$p = $q - $mbi;
$q = $p * $mbi;
$p = $q / $mbi;

if($p > 1233.999 && $p < 1234.001
   && Math::GMPf::get_refcnt($p) == 1
   && Math::GMPf::get_refcnt($q) == 1) {print "ok 35\n"}
else {print "not ok 35\n"}

$p *= $mbi;
$p /= $mbi;
$p += $mbi;
$p -= $mbi;

if($p > 1233.999 && $p < 1234.001
   && Math::GMPf::get_refcnt($p) == 1
   && Math::GMPf::get_refcnt($q) == 1) {print "ok 36\n"}
else {print "not ok 36\n"}

$q = $mbi + $p;
$p = $mbi - $q;

if($p > -1234.001 && $p < -1233.999
   && Math::GMPf::get_refcnt($p) == 1
   && Math::GMPf::get_refcnt($q) == 1) {print "ok 37\n"}
else {print "not ok 37\n"}


$q = $mbi * $p;
$p = $mbi / $q;

if($p < -0.00081 && $p > -0.000811
   && Math::GMPf::get_refcnt($p) == 1
   && Math::GMPf::get_refcnt($q) == 1) {print "ok 38\n"}
else {print "not ok 38\n"}

Rmpf_set_str($p, "1234567.123", 0);

if($p > $mbi &&
   $p >= $mbi &&
   $mbi < $p &&
   $mbi <= $p &&
   ($p <=> $mbi) > 0 &&
   ($mbi <=> $p) < 0 &&
   $p != $mbi &&
   !($p == $mbi) &&
   Math::GMPf::get_refcnt($p) == 1) {print "ok 39\n"}
else {print "not ok 39\n"}

$mbi = \$p;
$ok = '';

eval{$q = $p + $mbi;};
if($@ =~ /Invalid argument/) {$ok = 'a'}
eval{$q = $p * $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'b'}
eval{$q = $p - $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'c'}
eval{$q = $p / $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'd'}
eval{$q = $p ** $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'e'}
eval{$p += $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'f'}
eval{$p *= $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'g'}
eval{$p -= $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'h'}
eval{$p /= $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'i'}
eval{$p **= $mbi;};
if($@ =~ /Invalid argument/) {$ok .= 'j'}

if($ok eq 'abcdefghij') {print "ok 40\n"}
else {print "not ok 40 $ok\n"}
