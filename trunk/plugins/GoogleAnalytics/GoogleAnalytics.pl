# GoogleAnalytics plugin for Movable Type
# Author: Milad Nekofar (http://www.nekofar.com)
# Released under the Artistic License
#
# $Id$

package MT::Plugin::GoogleAnalytics;

use strict;
use MT::Plugin;

my $plugin = MT::Plugin->new({
	name => '<MT_TRANS phrase="Google Analytics">',
	version => '0.2',
	description => '<MT_TRANS phrase="This plugin makes it simple to add Google Analytics codes to your weblog.">',
	author_name => '<MT_TRANS phrase="Milad Nekofar">',
	author_link => 'http://wwww.nekofar.com/',
	l10n_class => 'GoogleAnalytics::L10N',
	icon => 'images/icon.gif',
});
MT->add_plugin($plugin);

use MT::Template::Context;
MT::Template::Context->add_tag('GoogleAnalytics', sub {
	my ($ctx, $args, $cond) = @_;
	my $ua = $args->{'ua'};
	my $script = '
       '.'<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
       '.'<script type="text/javascript">
       '.'_uacct = "'.$ua.'";
       '.'urchinTracker();
       '.'</script>';
    return $script;
	}
);