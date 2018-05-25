requires 'Moo';
requires 'Role::REST::Client';
requires 'Types::Standard';
requires 'namespace::clean';
requires 'strictures', '2';

on configure => sub {
    requires 'Module::Build::Tiny', '0.034';
    requires 'perl', '5.008005';
};

on test => sub {
    requires 'Test::More';
    requires 'Test::Warn';
};
