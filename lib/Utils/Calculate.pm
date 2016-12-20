package Utils::Calculate; {

=encoding utf8
=head1 NAME
    Different credit calculation routines
=cut

use 5.012000;
use strict;
use warnings;
use utf8;

use Utils::Credits;

sub validateCreditAmount{
    my $creditAmount = shift;
    $creditAmount =~ s/[\D\s]//g ;
    return $creditAmount if $creditAmount && $creditAmount >= $Utils::Credits::MinAmount && $creditAmount <= $Utils::Credits::MaxAmount;
    return undef;
};

sub credit{
    my ($self,$creditAmount) = @_ ;
    my $creditRemains = $creditAmount % $Utils::Credits::MinAmount;
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
