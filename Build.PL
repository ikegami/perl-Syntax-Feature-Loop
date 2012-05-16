#!/usr/bin/env perl

use strict;
use warnings;

use Module::Build qw( );

my $build = Module::Build->new(
   module_name => 'feature::loop',
   dist_author => 'Eric Brine <ikegami@adaelis.com>',
   license     => 'CC0_1_0',
   configure_requires => {
      'Module::Build'              => 0.36_14,
      'Software::License::CC0_1_0' => 0,
   },
   build_requires => {
      # For testing only
      # ----------------
      #'Pod::Coverage' => 0.18,      # Optional.
      'Test::More'     => 0,
      #'Test::Pod'     => 1.22,      # Optional.

      # For developer tests only
      # ------------------------
      #'Test::Pod::Coverage' => 1.08,      # Optional.
   },
   requires => {
      'perl'               => 5.014000,
      'Devel::CallParser'  => 0,
      'Lexical::Sub'       => 0,
      'version'            => 0,
      'XSLoader'           => 0,
   },
   PL_files => { 'make_call_parser.PL' => 'callparser1.h' },
   add_to_cleanup => [ 'feature-loop-*', 'vc100.pdb' ],
   resources => {
      homepage => 'http://search.cpan.org/dist/feature-loop/',
      #license => [ ],  # Populated by Software::License::*
      bugtracker => {
         web     => 'http://rt.cpan.org/Public/Dist/Display.html?Name=feature-loop',
         #mailto => 'bug-feature-loop@rt.cpan.org',
      },
      repository => {
         type => 'git',
         url  => 'git://github.com/ikegami/perl-feature-loop.git',
         web  => 'http://github.com/ikegami/perl-feature-loop',
      }
   },
);

$build->create_build_script();
