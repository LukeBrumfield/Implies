#!/usr/bin/perl

use CGI;
use DBI;
use Data::Dumper;
use strict;

print "content-type: text/plain\n\n";

my $q=new CGI;

my $Key = $q->param('KeyName') || $ARGV[0];
my $MRNumber = $q->param('MRNumber') || $ARGV[2] || 0;
my $FreeText = $q->param('FreeText') || $ARGV[3] || 0;
my $Overwrite = $q->param('Overwrite') || $ARGV[1] || 0;

my $date = `/bin/date`;
chomp $date;
open MYFILE, '>>', "/tmp/log.txt" or die $!;
print MYFILE "$date $Key\t $MRNumber\t $FreeText\n";
close MYFILE;

my $dbh=DBI->connect('dbi:mysql:Zoo','root','implies');

my $sql = "select * from Citations where ref_Citation = ?"; #ref_Citation is the primary key
my $sh = $dbh->prepare($sql);
my $c = $sh->execute($Key);

$sh->finish();

if ($c == 0)
{
	my $sth;
    $sql = "INSERT INTO Citations VALUES (?, ?, ?)";
    $sth = $dbh->prepare($sql) or die "Can't prepare $sql: $dbh->errstrn";
    my $c = $sth->execute($Key, $MRNumber, $FreeText);
    print "Added\n";
}
elsif( $Overwrite > 0 )
{
    $sql = "delete from Citations where ref_Citation = ?";
    $sh = $dbh->prepare($sql);
    $sh->execute($Key);
    $sh->finish();
    print ("Deleted\n");
    
  if ($Overwrite == 1) 
  {
    $sql = "INSERT INTO Citations VALUES(?, ?, ?)";
    $sh = $dbh->prepare($sql) or die "Can't prepare $sql: $dbh->errstrn";
    $sh->execute($Key, $MRNumber, $FreeText) or die "Connection Error: $dbh->errstr";
    print "Updated\n";

  }
}

$dbh->disconnect();
