use Scalar::Util qw{weaken};

while (1) {
	my $a = {'b' => {}};

	$a->{'b'}{'a'} = &weaken($a);
}

__END__
Сборщик муора не справляется