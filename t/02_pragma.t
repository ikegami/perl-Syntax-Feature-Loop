use strict;
use warnings;

use Test::More tests => 6;

my @warnings;
BEGIN {
   $SIG{__WARN__} = sub {
      push @warnings, $_[0];
      print(STDERR $_[0]);
   };
}

BEGIN { require feature::loop; }


my $x;
sub loop { $x = "func"; }

$x = undef;
loop;
is($x, "func", "Inactive on load");

{
   use feature::loop;
   $x = undef;
   loop { $x = "loop"; last; }
   is($x, "loop", "Active on 'use'");

   {
      no feature::loop;
      $x = undef;
      loop;
      is($x, "func", "Inactive on 'no'");
   }

   $x = undef;
   loop { $x = "loop"; last; }
   is($x, "loop", "'no' lexically scopped");
}

$x = undef;
loop;
is($x, "func", "'use' lexically scopped");

ok(!@warnings, "no warnings");

1;
