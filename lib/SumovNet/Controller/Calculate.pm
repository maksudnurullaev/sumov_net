package SumovNet::Controller::Calculate; {

use Mojo::Base 'Mojolicious::Controller';

use Utils::Calculate ;
use Utils::Validators ;
use Data::Dumper;

sub start{
    my $self = shift;
    
    Utils::Validators::calculate_start($self);
};

sub selected{
    my $self = shift;
    return if $self->req->method ne 'POST' ;

    if( my $record = Utils::Validators::calculate_selected($self) ){
        Utils::Calculate::insert_new_client($self,$record);
        $self->redirect_to('/calculate/finish');
    }
};

};

1;

