package Ryuu::Wobject::Page;

our $VERSION = '0.001';

use Modern::Perl '2010';
use Moose;
use Dancer::Plugin::DBIC 'schema';

sub new_by_id {
    my $self    = shift;
    
    
};

sub render {
    my $self        = shift;
    my $template    = $self->template;

    # One db query is better than 2!
    my @nodes   = schema( 'Ryuu' )->resultset( 'node' )->search(
        {
            parent_id => $self->id
        }
    );

    # Get all nodes for this page.
    foreach my $node_id ( $template =~ m/ryuu-node-([a-zA-Z0-9]+)/g ) {
        my $node;

        # Render node againt TT.
        my $rendered_node = $node->render;        

        # Replace node place holder with actual rendered node.
        $template =~ s/ryuu-node-$node/\Q$rendered_node/e;
    }
    
    return $template;
};

1;