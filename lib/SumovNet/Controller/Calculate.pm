package SumovNet::Controller::Calculate; {

use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper ;
use Utils::Calculate ;

sub start{
    my $self = shift;
    
    my $creditAmount = $self->param('creditAmount');
    if( $creditAmount = Utils::Calculate::validateCreditAmount($creditAmount) ){
		Utils::Calculate::credit($self,$creditAmount);
        $self->stash( {creditAmount => $creditAmount} );
    } else {
        $self->stash( {formWithError => 1} ) if $self->param('creditAmount') ;
    }
};


};

1;

