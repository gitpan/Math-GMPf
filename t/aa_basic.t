use warnings;
use strict;
use Math::GMPf qw(:mpf);

print "1..1\n";

print STDERR "\n# Using Math::GMPf version ", $Math::GMPf::VERSION, "\n";
print STDERR "# Using gmp library version ", Math::GMPf::gmp_v(), "\n";

if($Math::GMPf::VERSION eq '0.26') {print "ok 1\n"}
else {print "not ok 1 $Math::GMPf::VERSION\n"}