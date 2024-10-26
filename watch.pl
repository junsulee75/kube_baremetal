#!/usr/bin/perl

use strict ;
use Getopt::Std ;
# use Data::Dumper ;


sub usage {
	print <<EOF;

watch.pl -e command [ioc] [s]

-e  : execute this command
-p  : regex pattern to watch for
-i  : interval to refresh
-v  : verbose
-s  : silent watch , dont print output to screen
-h  : show this help
-c  : count the number of times a pattern appears
-o  : count and loop until it occurs X times.
-P  : show non running/completed PODS while watching.  On by default.  -P to turn it off
-B	: show bad pods
EOF
exit(1)
}

my $opt = {} ;
getopts( "e:p:i:vshco:PB", $opt ) ;

usage() if ( defined $opt->{h} );

my $cmd = $opt->{e} ;
my $cond = $opt->{p} ;
my $interval = $opt->{i} || 10 ;
my $silent = ( defined $opt->{s} ) ? 1 : 0 ;
my $occurs =  $opt->{o} ;
my $viewpods = ( defined $opt->{P} ) ? 0 : 1 ;


sub see 
{
	my ( $cmd , $cond ) = @_ ;

	my $found = 0 ;
	open FH ,  "$cmd 2>&1 | " ;
	while ( <FH> ) {
	
		if ( m/$cond/i ) {
			$found++ ;
			print "Match = $_\n" if ( $opt->{v} ) ;
		};
		print if ( $silent != 1 ) ;
	}
	close FH ;

	return $found ;
}

sub showpods
{
	return if ( $viewpods == 0 ) ;

	open FH , "oc get pods -A -o wide 2>&1 |" ;
	while ( <FH> ) {
		next if ( m/Running|Completed/ ) ;
		print "$_" ;
	}
	close FH ;
	print "\n" ;
}

# check if the executed command has the pattern
if ( defined $opt->{c} ) {
	my $ntimes = see ( $cmd , $cond ) ;
	exit($ntimes) ;
}

# loop until X times

if ( defined $opt->{o} ) {
	for ( my $i ;; $i++ ) {
		my $ntimes = see ( $cmd , $cond ) ;
		exit if ( $ntimes == $occurs ) ;
		printf "Running [$cmd] to watch for [$cond] occurs [$occurs] time at interval of [$interval] seconds, count = %d s\n" , $i * $interval ;
		showpods() if ( $opt->{B} ) ;
		sleep ( $interval ) ;
	}
}

for ( my $i = 0 ;; $i++ ){

	last if ( see ( $cmd , $cond ) > 0 ) ;
	printf "Running [$cmd] to watch for [$cond] - interval $interval , count = %d s\n" , $i * $interval ;
	showpods() if ( $opt->{B} ) ;
	sleep ( $interval ) ;
}

