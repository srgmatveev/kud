#!/usr/bin/env perl

use 5.014;

use warnings;
use strict;
use feature qw(say);

our $VERSION = 1.0;

my $kernel_site_path = "https://www.kernel.org/";
my $dir_to_file_from_path = "./tmp";

use FindBin;
use lib "$FindBin::Bin/../lib";
use Download;
use mCopyFile;

my $ref = Download->new($kernel_site_path);
$ref->get_file();

my $cp_file_from_url = mCopyFile->new($dir_to_file_from_path, $ref->get_link_path );
$cp_file_from_url->copy_file();