use strict;
use warnings;
use DBI;

my $dbh = DBI->connect(@::ENV{+qw{DB_DSN DB_USER DB_PASSWD}});
my ($size, $offset) = (1000, 0);

$offset += $size while @{$dbh->selectall_arrayref(<< ".")}
SELECT
	`t1`.`id`
	, `t1`.`data`
FROM
	`test` AS `t1`
LIMIT $size OFFSET $offset;
.
