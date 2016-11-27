#SassScotch

A fork of..... [Scotch Box](https://github.com/scotch-io/scotch-box)

The amalgamation of the name is based on the mysterious ape man, Sasquatch (also known as Bigfoot), not the stylesheet language we all know and love)

A work in progress, and in progress meaning I just started this today. Goal is to make a light weight alternative to VVV for use with WordPress development. Needs to install WP automagically and also needs to install xDebug.

## 11/27/16 Xdebug working, not worth the trouble, no longer a work in progress

TODO:

- Stop trying to make this work
- Make my own box

I'm not going to work on this fork anylonger, but ongoing conversation on Xdebug and ScotchBox can be followed here: https://github.com/scotch-io/scotch-box/issues/7

I think the issue has been that the PPA is obsolete. See: http://askubuntu.com/questions/741913/php7-0-dev-installation-fails-on-ubuntu-14-0-4

I was able to get it installed by following [these steps](http://askubuntu.com/a/744382) from the same Ask Ubuntu thread, then installing Xdebug, then restarting the server.

So the script follows these steps -

- Get rid of the old PPA
	`sudo apt-get install ppa-purge`
	`ppa-purge ppa:ondrej/php5-5.6`

- Add the current PPA
	`sudo add-apt-repository ppa:ondrej/php`

Update
	`sudo apt get update`
	`sudo apt-get upgrade`
	`sudo apt-get autoremove`

Install Xdebug
	`sudo apt-get install php5-xdebug`

Configure Xdebug
	`sudo vim /etc/php5/apache2/conf.d/20-xdebug.ini`
add to the file, save and close

	```
	zend_extension=xdebug.so
	xdebug.remote_enable=1
	xdebug.remote_connect_back=1
	xdebug.remote_port=9000
	xdebug.remote_host=192.168.33.10
	```
Restart apache
	`sudo service apache2 restart`

Problems and Disclaimers:

1. I have no idea what I'm doing.
2. Other things may now be broken, I have no idea, YMMV.
3. Somewhere along the line one of these processes creates an empty html directory for some reason.
4. `vagrant up` takes a really long time because everything has to be updated.

* But, Xdebug is working! *

Unfortunately Xdebug is working at the expense of the speed, convenience, ease of use and all the other things that drew me to ScotchBox in the first place (and possibly at the expense of breaking other things.) 

I think the main underlying problem is that the ScotchBox itself needs an update. 

It was last updated in November of 2005 and doesn't seem to be regularly maintained. There's been updates, but nothing major, and the [base box hasn't been updated for over a year](https://atlas.hashicorp.com/scotch/boxes/box/versions/2.5). 

Again, no idea what I'm doing, but if updating everything makes it possible to install Xdebug then it seems to follow that the base box probably needs a refresh. Another example, WP-CLI was added in November (but no Xdebug because it will "throw beginners of their game"?) but the WP-CLI version that ships with the box is out of date and isn't compatible with the current version of WordPress. So it needs to be immediately updated in order to be used.

I don't know, Scotch isn't really a solution for me anymore and rather than trying to make it work for me I think I'd personally be better off learning how to make my own box.

Regardless, I'm super appreciative to have been able to use ScotchBox for the past couple years. Thanks for the great work, I've learned a ton.

8/9/16

- Add auto install WordPress
- Change the Scotch index.php to info.php 
- Add xDebug install
- Tweaks to vagrant file
  
TODO 

- Test xDebug
- GUI for site setup (site name, dev url, base WP options)
- Randomize box IP address (similar to WP Lib Box) 

## Scotch Box

### Check out the official docs at: [box.scotch.io][16]
### [Read the getting started article](https://scotch.io/bar-talk/introducing-scotch-box-a-vagrant-lamp-stack-that-just-works)
### [Read the 2.0 release article](https://scotch.io/bar-talk/announcing-scotch-box-2-0-our-dead-simple-vagrant-lamp-stack-improved)
#
