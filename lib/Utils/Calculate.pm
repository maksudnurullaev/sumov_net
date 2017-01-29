package Utils::Calculate; {

=encoding utf8
=head1 NAME
    Different credit calculation routines
=cut

use 5.012000;
use strict;
use warnings;
use utf8;

use POSIX qw( ceil ) ;
use Db;
use Data::Dumper;

sub credit{
    my ($self,$creditAmount,$months) = @_ ;
    $creditAmount =~ s/[\D\s]//g ;
    my $result = { creditAmount => $creditAmount,
                   months       => $months,
                   percent      => Utils::Credits::getPersent4Month($months),  
                   pay_first    => ceil ( $creditAmount * $Utils::Credits::MinPrepayPercent / 100 ),
                   pay_rest     => -1,
                   pay_monthly  => -1,
                   pay_total    => -1,
                   z_earning    => -1 } ;
    $result->{pay_rest}    = $creditAmount - $result->{pay_first} ;
    $result->{pay_total}   = ceil ($result->{pay_rest} + $result->{pay_rest} * $months * $result->{percent} / 100 ) ;
    #rounding
    $result->{pay_monthly} = ceil ($result->{pay_total} / $months ) ;
    $result->{z_earning}   = $result->{pay_total} - ($result->{pay_first} + $result->{creditAmount});

    return( $result );
};

sub insert_new_client{
    my ($self,$record) = @_ ;
    $record->{object_name} = 'client' ;
    $record->{status} = 'new' ;
    
    my $dbh = Db->new($self);
    $dbh->insert($record);
   
    $self->app->log->warn("TODO add new record 'user info' with credit wishes");
    warn Dumper $record;
  
};

# END OF PACKAGE
};

1;

__END__

=head1 AUTHOR

    M.Nurullaev <maksud.nurullaev@gmail.com>

=cut
