use strict;
use warnings;
use DBI;

my $sth_sel = DBI->connect(@::ENV{+qw{DB_DSN DB_USER DB_PASSWD}})->prepare(<< '.');
SELECT
	`t1`.`id`
	, `t1`.`data`
FROM
	`test` AS `t1`;
.
$sth_sel->execute;

undef while $sth_sel->fetchrow_array;

$sth_sel->finish;

__END__
Connection timeout