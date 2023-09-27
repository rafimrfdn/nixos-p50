{config, pkgs, ...}:

{

services.caddy = {
    #package = pkgs.caddy;
    enable = true;
    #user = "nix";
    #group = "users";
    extraConfig = ''
  	  local.nixhost {
  		  encode gzip
  		  root * /var/www
  	} 	
    '';
    virtualHosts = {
    	"local.nixhost" = {
    		extraConfig = ''
    		  encode gzip
    		  root * /var/www
    		'';
        };
     };
  };

}
