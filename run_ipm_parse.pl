#!/usr/bin/perl
#

my $list = `ls files/`;
#
#print "This is the list", $list;

my @files= split /\s+/,  $list;

#print @files;
#print @list;

	print "These are the files\n";
foreach $a(@files)
{
	print $a, "\n";
#	system("ipm_parse -full $a > dump/$a");
	`ipm_parse -full files/$a >dump/$a`
}
	
