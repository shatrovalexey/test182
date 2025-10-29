use strict;
use warnings;
use Data::Dumper;

sub getRemoveDuplicates($) {
	my ($hash) = @_;
	my %keys;

	reset %$hash;

	while (my($key, $key2) = each %$hash) {
		if (exists $keys{$key2}) {
			delete $hash->{$key}
		} else {
			$keys{$key2} = undef
		}
	}

	$hash
}

my %h = qw{x x d f x d y x};

print Dumper getRemoveDuplicates \%h