use strict;
use warnings;
use Data::Dumper;
use Digest::SHA1 qw{sha1_hex};

sub getRemoveDuplicates($) {
	my ($hash) = @_;
	my %keys;

	reset %$hash;

	while (my($key, $value) = each %$hash) {
		my $key2 = &sha1_hex($value);

		delete $hash->{$key} if exists $keys{$key2};

		$keys{$key2} = undef
	}

	$hash
}

my %h = qw{x x d f x d y x};

print Dumper getRemoveDuplicates \%h