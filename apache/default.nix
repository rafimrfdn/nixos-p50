{ lib, config, pkgs, ...}:

{

networking.firewall.allowedTCPPorts = [ 80 443 ];
# apache
services.httpd.enable = true;
services.httpd.package = pkgs.apacheHttpd;
# php
services.httpd.enablePHP = true;
services.httpd.phpPackage = pkgs.php;
# mysql
services.mysql.enable = true;
services.mysql.package = pkgs.mariadb;

# setting apache virtualhost
services.httpd.user = "nix";
services.httpd.group = "users";

services.httpd.virtualHosts = {
 "wp.localhost" = {
	documentRoot = "/home/nix/Project/wp/wordpress";
	extraConfig = ''
		Timeout 600
		ProxyTimeout 600

		Alias /wordpress "/home/nix/Project/wp/wordpress/"
		DirectoryIndex index.php index.html index.htm
		<Directory "/home/nix/Project/wp/wordpress/">
			Options FollowSymLinks
			AllowOverride Limit Options FileInfo
			DirectoryIndex index.php
			Require all granted
		</Directory>
		'';
	addSSL = true;
	enableACME = true;
	};
# "drupal.localhost" = {
#	documentRoot = "/home/nix/Project/drupal/drupalweb";
#	extraConfig = ''
#		Alias /drupal "/home/nix/Project/drupal/drupalweb/"
#
#		<Directory "/home/nix/Project/drupal/drupalweb/">
#			Options Indexes FollowSymLinks
#		        AllowOverride All
#		        Require all granted
#		</Directory>
#		'';
#	addSSL = true;
#	enableACME = true;
#	};
# "joomla.localhost" = {
#	documentRoot = "/home/nix/Project/joomla/joomlaweb";
#	extraConfig = ''
#		Timeout 600
#		ProxyTimeout 600
#
#		Alias /joomla "/home/nix/Project/joomla/joomlaweb/"
#		DirectoryIndex index.php index.html index.htm
#		<Directory "/home/nix/Project/joomla/joomlaweb/">
#			Options FollowSymLinks
#			AllowOverride Limit Options FileInfo
#			DirectoryIndex index.php
#			Require all granted
#		</Directory>
#		'';
#	addSSL = true;
#	enableACME = true;
#	};
};

services.httpd.phpOptions = ''
  date.timezone = "Asia/Makassar";
  display_errors = on;
  upload_max_filesize = "100M";
  post_max_size = "100M";
'';

security.acme = {
	acceptTerms = true;
	useRoot = true;
	certs = {
		"wp.localhost" = {
			webroot = "/var/lib/acme/acme-challenge";
			email = "youremail@address.com";
		};
		#"drupal.localhost" = {
		#	webroot = "/var/lib/acme/acme-challenge";
		#	email = "youremail@address.com";
		#};
		#"joomla.localhost" = {
		#	webroot = "/var/lib/acme/acme-challenge";
		#	email = "youremail@address.com";
		#};
	};
};


services.phpfpm.pools.mypool = {
  user = "nobody";
  settings = {
    pm = "dynamic";
    "listen.owner" = config.services.httpd.user;
    "pm.max_children" = 5;
    "pm.start_servers" = 2;
    "pm.min_spare_servers" = 1;
    "pm.max_spare_servers" = 3;
    "pm.max_requests" = 500;
  };
};

}
