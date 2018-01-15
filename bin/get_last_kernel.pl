#!/usr/bin/env perl

use 5.014;

use warnings;
use strict;
use feature qw(say);

our $VERSION = 1.0;

my $kernel_site_path = "https://www.kernel.org/";

use FindBin;
use lib "$FindBin::Bin/../lib";
use Download;


my $ref = Download->new($kernel_site_path);
$ref->get_file();