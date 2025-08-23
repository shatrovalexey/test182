use strict;
use warnings;
use DBI;

my $dbh = DBI->connect(@::ENV{+qw{DB_DSN DB_USER DB_PASSWD}});
my ($size, $offset) = (1000, 0);

do {
	my $sth_sel = $dbh->prepare(<< ".");
SELECT
	`t1`.`id`
	, `t1`.`data`
FROM
	`test` AS `t1`
LIMIT $size OFFSET $offset;
.
	$sth_sel->execute;

	last + ( ) unless $sth_sel->rows > 0;

	undef while $sth_sel->fetchrow_array;

	$sth_sel->finish;
	$offset += $size;
} until undef