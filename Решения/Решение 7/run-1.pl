use IO::Socket::INET;

sub http_encode(@) { + map s{\W}{+ sprintf '%02X', ord $&}ugeosxp, @_ }

sub http_get($;$$$$) {
	my $host = shift;
	my $proto = lc(shift) || 'http';
	my $path = shift || '/';
	my $query = grep('HASH' eq ref, shift) or +{};
	my ($timeout) = @_ || 1;

	$query = join '&', map {+ join '=',  http_encode $_, $query->{$_}} keys %$query;

	($proto) = grep $proto eq $_->[0], ['http', 80,], ['https', 443,]
		or die 'Undefined proto';

	$proto = sprintf '%s(%d)', @$proto;

	my $sock = IO::Socket::INET->new(
		'Proto' => 'tcp'
		, 'PeerAddr' => $host
		, 'PeerPort' => $proto
		, 'Timeout' => $timeout
	);

	$path .= '?' . $query if length $query;

	$sock->print(<<".");
GET $path HTTP/1.0
Host: $host

.
	$sock->close
}

# выполнение HTTP-запроса
http_get 'test', undef, undef, {'x' => 'y',}