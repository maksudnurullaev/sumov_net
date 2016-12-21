package Utils::Credits; {

=encoding utf8
=head1 NAME
    Different initial values
=cut

use 5.012000;
use strict;
use warnings;
use utf8;

our $MinAmount = 100000 ;
our $MaxAmount = 10000000 ;
our $MinMonth  = 3 ;
our $MaxMonth  = 5 ;
our $MaxPercent = 20 ;
our $MinPercent = 10 ;
our $MinPrepayPercent = 10 ;

our $Months    = [$MinMonth..$MaxMonth] ;

sub getPersent4Month{
    my $month = shift;
    return undef if $month < $MinMonth || $month > $MaxMonth ; 
    return ($MaxPercent - $month) ;
};

# END OF PACKAGE
};

1;

__END__

=head1 AUTHOR

    M.Nurullaev <maksud.nurullaev@gmail.com>

=cut
