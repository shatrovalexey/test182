package AA;
sub func { print "AA\n" }
package BB;
use base qw{AA};
sub func { print "BB\n"; shift->SUPER::func(@_); }
package CC;
use base qw{AA};
sub func { print "CC\n"; shift->SUPER::func(@_); }
package DD;
use base qw{BB CC};
sub func { print "DD\n"; shift->SUPER::func(@_); }

package main;

DD->func
__END__
DD
BB
AA