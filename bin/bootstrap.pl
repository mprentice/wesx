#!/usr/bin/perl

use 5.008;
use strict;
use warnings;
use utf8;
use version 0.77; our $VERSION = qv("v0.0.1");
use Carp;
use Cwd qw(abs_path);
use Getopt::Long;
use FindBin;
use File::Spec::Functions;

exit main(@ARGV) unless caller;

sub usage {
    return <<END_USAGE;
Usage: perl bin/bootstrap.pl

Bootstrap to use cpanminus, local::lib and Carton to install
required dependencies on a fresh install with system perl.
END_USAGE
}

sub main {
    local @ARGV = @_;

    # parse options
    my ($help);
    GetOptions(
        'help' => \$help,
    );

    if ($help) {
        print usage;
        return 0;
    }

    my $curdir = abs_path;
    eval {
        my $base_dir = abs_path(catfile($FindBin::Bin, '..'));
        my $local_dir = catfile($base_dir, 'local');
        my $bin_dir = catfile($local_dir, 'bin');
        chdir $base_dir or confess "Could not chdir $base_dir: $!";
        if (! -d "$local_dir") {
            mkdir $local_dir or confess "Could not mkdir $local_dir";
        }
        if (! -d "$bin_dir") {
            mkdir $bin_dir or confess "Could not mkdir $bin_dir";
        }
        bootstrap($local_dir, $bin_dir);
    };
    if ($@) {
        chdir $curdir;
        confess $@;
    }

    chdir $curdir;
    return 0;
}

sub bootstrap {
    my ($local_dir, $bin_dir) = @_;
    my $cpanm = catfile($bin_dir, 'cpanm');
    my $carton = catfile($bin_dir, 'carton');
    if (! -f $cpanm) {
        run_or_die('curl', '--location', '--insecure',
                   '--output' => $cpanm, "http://cpanmin.us");
        chmod 0755, $cpanm;
    }

    run_or_die( $cpanm, '--notest', '--local-lib-contained' => $local_dir,
                qw(App::cpanminus App::local::lib::helper Carton) );

    my $perl5_dir = catfile($local_dir, 'lib', 'perl5');
    local $ENV{PERL5LIB} = $perl5_dir;
    run_or_die($carton, 'install');
}

sub run_or_die {
    my @args = @_;
    system(@args) == 0
        or confess "Error while running: " . join(q( ), @args);
    return;
}
