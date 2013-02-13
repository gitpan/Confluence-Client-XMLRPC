
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Client for the Atlassian Confluence wiki, based on RPC::XML",
  "AUTHOR" => "Asgeir Nilsen, Giles Lewis, Martin Ellis, Torben K. Jensen, Heiko Jansen <hjansen\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Confluence-Client-XMLRPC",
  "EXE_FILES" => [],
  "LICENSE" => "gpl",
  "NAME" => "Confluence::Client::XMLRPC",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Data::Dumper" => 0,
    "RPC::XML" => 0
  },
  "VERSION" => "2.2",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



