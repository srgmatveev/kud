#!/usr/bin/env perl

use 5.014;
use strict;
use warnings;

our $VERSION = 1.0;

use Test::More qw(no_plan);;


use FindBin;
use lib "$FindBin::Bin/../lib";

BEGIN { use_ok( 'mCopyFile' ); }
  require_ok( 'mCopyFile' );
