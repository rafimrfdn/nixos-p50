{ lib, config, pkgs, ... }:

{

######
# untuk bisa berhasil install wordpress!
# masuk ke mysql dengan mengetik `mysql -u root` saja
# catatan: saat proses instalasi wordpress, tidak usah isi kolom password datababase.
######


##################################


# nginx is sandboxed and doesn't allow reading from /home
  systemd.services.nginx.serviceConfig = {
    ProtectSystem = lib.mkForce false;
    ProtectHome = lib.mkForce false;
  };
  services.nginx = {
    user = "nix"; # because all content is served locally in home for testing
    group = "users"; # rafi add this
    enable = true;
    recommendedGzipSettings = true;
    virtualHosts = {
      #"local.nixhost" = {
      #  root = "/home/nix/Project/wp/nginx";
      #  locations."/".extraConfig = "index index.php autoindex on;";
      #};
      #"www" = {
      #  default = true;
      #  root = "/home/philm/dev/personal/www/";
      #  locations."/".extraConfig = "autoindex on;";
      #};
      "local.nixhost" = {
        # simple test for SPAs, that need to use / with normal history routing
	#enableACME = true;
	#forceSSL = true;
        root = "/home/nix/Project/wp/nginx";
	#extraConfig = ''
    	#	index index.php;
    	#'';
    	locations."/".extraConfig = ''
    	         try_files $uri $uri/ /index.php?$args;
    	'';
	locations."~ \\.php$".extraConfig = ''
      		fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
      		fastcgi_index index.php;
    	'';
    	locations."~* /(?:uploads|files)/.*\.php$".extraConfig = ''
    	         deny all; 
    	'';
    	locations."~* \.(js|css|png|jpg|jpeg|gif|ico)$".extraConfig = ''
    	           expires max;
    	           log_not_found off;
    	'';
      };
    };
  };



  services.mysql = {
    user = "nix";
    group = "users";
    enable = true;
    package = pkgs.mariadb;
 };
 services.longview.mysqlPasswordFile = "/run/keys/mysql.password";

#security.acme = {
#	acceptTerms = true;
#};
#security.acme.certs = {
#	"local.nixhost".email = "youremail@address.com";
#};
  
  #networking.firewall.allowedTCPPorts = [80 443];
  
  services.phpfpm.pools.mypool = {
    user = "nix";
    group = "users";
    settings = {
      "pm" = "dynamic";
      "pm.max_children" = 75;
      "pm.start_servers" = 10;
      "pm.min_spare_servers" = 5;
      "pm.max_spare_servers" = 20;
      "pm.max_requests" = 500;
    };
  };

services.phpfpm.phpOptions = ''
  date.timezone = "Asia/Makassar";
  display_errors = on;
  upload_max_filesize = "100M";
  post_max_size = "100M";
'';


}

