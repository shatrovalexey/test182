sub nearest1($$) {
    my ($arr, $needed) = @_;
	my $diffPrev = 0;

	for (my $i = $#$arr; $i >= 0; $i --) {
		my $diff = $needed - $arr->[$i];

		return $i unless $diff;
		return abs($diff) < $diffPrev ? $i : $i + 1 if $diff > 0;

		$diffPrev = abs $diff;
	}

	0
}

sub nearest2($$) {
    my ($arr, $needed) = @_;
    my ($low, $high) = (0, $#$arr);
    
    while ($low <= $high) {
        my $mid = int(($low + $high) / 2);

		return $mid if $arr->[$mid] == $needed;

		if ($arr->[$mid] > $needed) {
			$high = $mid - 1;

			next
		}

        $low = $mid + 1
    }

	return $high if $low > $#$arr;
    return $low if $high < 0;
	return $low if abs($arr->[$low] - $needed) < abs($arr->[$high] - $needed);

	$high
}

sub getArgs($) {
	my ($max) = @_;
	my @result;

	while (($max > 0) && !@result) { # ожидаются только непустые массивы
		for (my $i = 0; $i < $max; $i ++) {
			push @result, $i if 0.5 > rand
		}
	}

	+ (\@result, int $max * rand)
}

use Benchmark qw(:all);

cmpthese(1000, {
	'nearest1' => sub {
		&nearest1(&getArgs($max))
	}
	, 'nearest2' => sub {
		&nearest2(&getArgs($max))
	}
});