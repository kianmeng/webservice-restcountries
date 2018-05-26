requires 'Data::Serializer';
requires 'JSON';
requires 'Moo';
requires 'namespace::clean';
requires 'REST::Client';
requires 'Role::REST::Client';
requires 'strictures', '2';
requires 'Types::Standard';

on configure => sub {
    requires 'Module::Build::Tiny', '0.034';
    requires 'perl', '5.008005';
};

on test => sub {
    requires 'Test::More';
    requires 'Test::Warn';
};

on 'develop' => sub {
    requires 'App::CISetup';
    requires 'App::Software::License';
    requires 'Dist::Milla';
    recommends 'Devel::NYTProf';
};
