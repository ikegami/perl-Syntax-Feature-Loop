use strict;
use warnings;

use Test::More tests => 1;

BEGIN { require_ok( 'feature::loop' ); }

diag( "Testing feature::loop $feature::loop::VERSION" );
diag( "Using Perl $]" );

1;
