requires 'Dancer,   '1.3124';
requires 'Moose',   '2.1209';

on 'develop' => sub {
    requires 'Data::Printer';
    recommends 'Devel::NYTProf';
};