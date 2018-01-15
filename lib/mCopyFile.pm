package mCopyFile;

use 5.014;
use strict;
use warnings;
use feature qw(say);


use File::Path qw( make_path );

sub new {

    my $class = shift;
    my $dir_to = shift; my $from_url = shift;
    my $self = { dir_to => $dir_to, from_url => $from_url};
    bless $self, $class;
}

sub copy_file {

    my $class = shift;

    if ( !-d $class->{dir_to} ) {
	eval{make_path $class->{dir_to}};
	die "Failed to create path: $class->{dir_to}\n $@" if $@;
    }
    system("wget -N -c -P $class->{dir_to} $class->{from_url}") == 0 or
    die "\nFailed get file: $class->{from_url}. $?";
 
}

1;
