{ config, ...}: 

{

#services.nginx = {
#  enable = true;
#  virtualHosts."wp.localhost" = {
#
#    locations."/" = {
#      proxyPass = "http://localhost:3000";
#    };
#
#
#    enableACME = true;
#    forceSSL = true;
#    root = "/home/nix/Project/wp/nixos-local/nixos-wp/wordpress";
#    locations."~ \\.php$".extraConfig = ''
#      fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
#      fastcgi_index index.php;
#    '';
#  };
#};
#
#services.mysql = {
#  enable = true;
#  #package = pkgs.mariadb;
#};
#
#services.phpfpm.pools.mypool = {                                                                               
#  user = "nix";                                                                                          
#  settings = {                                                                                               
#    pm = "dynamic";            
#    "listen.owner" = config.services.nginx.user;                                                                 
#    "pm.max_children" = 5;                                                                                         
#    "pm.start_servers" = 2;                                                                                       
#    "pm.min_spare_servers" = 1;                                                                                     
#    "pm.max_spare_servers" = 3;                                                                                      
#    "pm.max_requests" = 500;                                                                                          
#  };         
#
#};         

security.acme = {
  acceptTerms = true;
  email = "foo@bar.com";
  };

#services.nginx = {
#  enable = true;
#  virtualHosts."wp.localhost" = {};
#};
#services.wordpress.webserver = "nginx";

services.wordpress.sites."wp.localhost" = {};


}
