package SumovNet::Controller::Calculate; {

use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper ;

sub start{
    my $self = shift;
    
    my $creditAmount = $self->param('creditAmount');
    if( $creditAmount = validateCreditAmount($creditAmount) ){
        $self->stash( {creditAmount => $creditAmount} );
        $self->param( creditAmount => $creditAmount ) ;
    } else {
        $self->stash( {formWithError => 1} ) if $self->param('creditAmount') ;
    }
};

sub validateCreditAmount{
    my $creditAmount = shift;
    $creditAmount =~ s/[\D\s]//g ;
    return $creditAmount if $creditAmount > 100000 ;
    return undef;
};

};

1;

