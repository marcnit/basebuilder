#!/usr/bin/perl

use YAML::XS 'LoadFile';
use Data::Dumper;

my $current_path = $ENV{'CURRENT_DIR'};
my $file = $ARGV[0] || die "É necessário passar o arquivo para executar";
print "####### Lendo arquivo $file ######\n";

my $config = LoadFile($file);

for (keys %{$config->{dependencies}}) {
    print "####### Instalando Pacote NPM $_ $config->{dependencies}->{$_} ######\n";

    if ($config->{dependencies}->{$_}) {
      system("cd $current_path && npm install $_\@$config->{dependencies}->{$_}");
    } else {
      system("cd $current_path && npm install $_");
    }
}
