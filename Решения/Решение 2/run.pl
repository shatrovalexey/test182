use strict;
use warnings;
use constant {
	'PACKAGE_DELIMITER' => '::'
	,
};

package xxx::xxx::xxx::Object;

sub new($;@) {+ bless + {
	'_rx_methodName' => qr{
		${\&::PACKAGE_DELIMITER()}
			( # название метода, который "свойство"
				[^
					(?:
						${\&::PACKAGE_DELIMITER()}
					)
				]*
			)
		$
	}uisxo, splice @_, 1
}, shift}

sub AUTOLOAD {
	my ($self) = shift;
	my ($methodName) = do {
		no strict qw{vars};

		$AUTOLOAD
	} =~ $self->{'_rx_methodName'};

	@_ and $self->{$methodName} = shift
		or $self->{$methodName}
}

package main;

my $o = xxx::xxx::xxx::Object->new();

$o->xxx(12);

print $o->xxx;