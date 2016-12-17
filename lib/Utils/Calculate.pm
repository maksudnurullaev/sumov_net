package Utils::Calculate; {

=encoding utf8
=head1 NAME
    Different initial values
=cut

use 5.012000;
use strict;
use warnings;
use utf8;

my $MinCreditAmount = 100000;
my $MaxCreditAmount = 10000000;

sub validateCreditAmount{
    my $creditAmount = shift;
    $creditAmount =~ s/[\D\s]//g ;
    return $creditAmount if $creditAmount && $creditAmount >= $MinCreditAmount && $creditAmount <= $MaxCreditAmount;
    return undef;
};

sub credit{
    my ($self,$creditAmount) = @_ ;
    my $creditRemains = $creditAmount % $MinCreditAmount;
    my $creditMain = $creditAmount - $creditRemains;
    $self->stash( creditRemains => $creditRemains );
    $self->stash( creditMain => $creditMain );

};

# END OF PACKAGE
};

1;

__END__

=head1 AUTHOR

    M.Nurullaev <maksud.nurullaev@gmail.com>

=cut
