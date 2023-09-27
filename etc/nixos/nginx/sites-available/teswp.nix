{
  listen = [
    { host = "local.nixhost"; port = 80; }
  ];

  server_name = "local.nixhost";
  root = "/home/nix/Project/wp/nginx"; 
  index = [ "index.php" ];

  location ~ \.php$ {
    fastcgi_pass = "unix:/run/php-fpm.sock";
    include = "${config.services.php.package}/etc/nginx/fastcgi.conf";
  }
}
