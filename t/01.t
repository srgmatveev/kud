#!/usr/bin/env perl

use 5.014;
use strict;
use warnings;

our $VERSION = 1.0;

use Test::More qw(no_plan);


use FindBin;
use lib "$FindBin::Bin/../lib";

BEGIN {use_ok('Download');}
  require_ok('Download');

my $m_host = 'http://localhost';
my $installed = Download->new($m_host);
isa_ok($installed, "Download");


my $m_host_file = 'http://localhost/aaa.txt';

$installed->fill_path_from_get_link($m_host_file);
is( $installed->get_link_path, $m_host_file, "Returned name must be $m_host_file");

my $m_host_file_name = 'aaa.txt';

is( $installed->get_link_file_name, $m_host_file_name, "Returned name must be $m_host_file_name");
