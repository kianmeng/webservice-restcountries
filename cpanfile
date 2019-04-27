requires 'autodie';
requires 'namespace::clean';
requires 'strictures', '2';

requires 'CHI';
requires 'Data::Serializer';
requires 'Digest::MD5';
requires 'HTTP::Status';
requires 'JSON';
requires 'Moo';
requires 'REST::Client';
requires 'Role::REST::Client';
requires 'Sereal';
requires 'Types::Standard';

on configure => sub {
    requires 'perl', '5.008005';
    requires 'Module::Build::Tiny', '0.034';
};

on test => sub {
    requires 'Pod::Coverage::TrustPod';
    requires 'Test::CPAN::Meta';
    requires 'Test::DistManifest';
    requires 'Test::Exception';
    requires 'Test::HasVersion';
    requires 'Test::Kwalitee';
    requires 'Test::More';
    requires 'Test::Perl::Critic';
    requires 'Test::Pod::Coverage';
    requires 'Test::Warn';
};

on 'develop' => sub {
    recommends 'Devel::NYTProf';
    requires 'App::CISetup';
    requires 'App::Software::License';
    requires 'Dist::Milla';
    requires 'Dist::Zilla::App::Command::cover';
};
