# darcs

some personal hpgl fun, specific to my plotter.  There is nothing of
use here.

My Graphtec serial plotter sits on my local network through some
lan-232 box I found in my junk bin; it appears on port 2001 and 3001
on my network
  
  	/etc/hosts: 

  	192.168.1.26	plotter	# graphtec plotter

I've only got one working pen currently.  

I'm using CERN HpglView to 'preview' the output.  The plotter doesn't
seem to support the more modern hpgl variants - bezier_abs is kind of
all over the place.

I tweak darcs.pl in emacs, M-x riunit to kill the older preview and
launch a new instance of the viewer.

Poking around, it looks like I should just use Ghostscript to generate postscript - but I'd like to make sure that I'm emitting what actually looks like it'll work for my plotter.

https://github.com/FozzTexx/hp-plot


