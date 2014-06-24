requires 'Dancer,       '1.3124';
requires 'Moose',       '2.1209';
requires 'DBIx::Class', '0.08270';
requires 'Modern::Perl';

on 'develop' => sub {
    requires    'Data::Printer';
    recommends  'Devel::NYTProf';
};