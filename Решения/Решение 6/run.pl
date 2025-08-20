use Scalar::Util qw{weaken};

while (1) {
	my $a = {};
	$a->{func} = &weaken(sub {
		$a->{cnt}++;
	})
}

__END__
Сборщик муора не справляется