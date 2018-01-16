package Download;

use 5.014;
use strict;
use warnings;
use feature qw(say);

use LWP::UserAgent;
use HTML::TokeParser;
use Encode;

sub new {

    my $class = shift;
    my $url = shift;
    my $self = { URL => $url , link_path => "", link_file_name => "", charset => "utf8"};
    bless $self, $class;
}


sub get_file {

    my $class = shift;
    my $conn = LWP::UserAgent->new();
    
    my $response = $conn->get($class->{URL});

    die "Can't get $class->{URL} -- ", $response->status_line
	unless $response->is_success;

    my $ref_func = \&get_url($class, $response->content);
    fill_path_from_get_link($class,$$ref_func);
    
}

sub get_url {

    my $class = shift;
    my $ref_content = shift;
    $ref_content = decode($class->{charset}, $ref_content);
    my $p = HTML::TokeParser->new(\$ref_content) or
      die "Can't get page content: $!";

    while (my $token = $p->get_token())
    {
	if ($token->[0] eq "S" and 
		$token->[1] eq "td" and 
		    defined($token->[2]->{id}) and
			($token->[2]->{id} eq "latest_link")) {
	 my $get_link = $p->get_tag("a");
	
	     if (defined($get_link->[1]->{href})) {     
	      return  $get_link->[1]->{href};
	    }
	}
    }
    return "";
}

sub fill_path_from_get_link() {

    my $class = shift;
    my $m_path = shift;

    if(defined($m_path))
    {
	$class->{link_path} = $m_path;
	$class->{link_file_name} = (split(/\//, $m_path))[-1];
    }
}

sub get_link_path($) {

    my $class = shift;
    return $class->{link_path};
}

sub get_link_file_name($) {

    my $class = shift;
    return $class->{link_file_name};
}

1;
