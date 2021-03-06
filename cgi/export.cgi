#!/usr/bin/perl

use strict;
use DBI;

my $filename = "Zoo.xml";
my $xmldir = "/home/implies/public_html/html/";

open (OUTFILE, ">", $xmldir . $filename);

my $dbh=DBI->connect("DBI:mysql:database=Zoo;" 
             . "mysql_read_default_file=/home/implies/.my.cnf", 
               "", "", {'AutoCommit'=>0}),
   or die "Can't connect: $!\n";

print OUTFILE "<?xml version=\"1.0\"?>\n";
print OUTFILE "<zoo>\n";

my $sql = "SELECT * FROM Subsystems";
my $sth = $dbh->prepare ($sql);
$sth->execute ();
$sth->finish();
print OUTFILE " <subsystems>\n";

while (my ($name, $latex, $freetext, $citation) = $sth->fetchrow_array ())
{
    print OUTFILE "   <subsystem>\n";
    print OUTFILE "    <name>" . $name . "</name>\n";
    print OUTFILE "    <latex>" . $latex  . "</latex>\n";
    if($freetext !="")
    {
    print OUTFILE "    <freetext>" . $freetext . "</freetext>\n";
    }
    if($citation !="")
    {
    print OUTFILE "    <citation>" . $citation . "</citation>\n";
    }
    print OUTFILE "   </subsystem>\n";
}
    print OUTFILE "  </subsystems>\n";

my $sql = "SELECT * FROM Theorems";
my $sth = $dbh->prepare ($sql);
$sth->execute ();

    print OUTFILE "  <theorems>\n";

while (my ($left, $relate, $right, $citation) = $sth->fetchrow_array ())
{
    print OUTFILE "   <theorem>\n";
    print OUTFILE "    <left>" . $left . "</left>\n";
    print OUTFILE "    <relate>" . $relate  . "</relate>\n";
    print OUTFILE "    <right>" . $right . "</right>\n";
    if($citation !="")
    {
    print OUTFILE "    <citation>" . $citation . "</citation>\n";
    }
    print OUTFILE "   </theorem>\n";
}
    print OUTFILE "  </theorems>\n";

my $sql = "SELECT * FROM Citations";
my $sth = $dbh->prepare ($sql);
$sth->execute ();

    print OUTFILE "  <bibliography>\n";

while (my ($key, $mrn, $freetext) = $sth->fetchrow_array ())
{
    print OUTFILE "   <citation>\n";
    print OUTFILE "    <key>" . $key . "</key>\n";
    if($mrn !="")
    {
    print OUTFILE "    <mrn>" . $mrn  . "</mrn>\n";
    }
    #if($freetext !="")
    #{
    print OUTFILE "    <freetext>" . $freetext . "</freetext>\n";
    #}
    print OUTFILE "   </citation>\n";
}
    print OUTFILE "  </bibliography>\n";

$dbh->disconnect ();
print OUTFILE "</zoo>\n";
