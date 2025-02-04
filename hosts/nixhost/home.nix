{ config, pkgs, ... }:

{
  home.username = "nix";
  home.homeDirectory = "/home/nix";


  imports = [
   ./zsh/default.nix
   ./sway/default.nix
   ./waybar/default.nix
   ./tmux/default.nix
   # ./neovim/default.nix
   ./gtk/default.nix
   ./kitty/default.nix
   ./xdg/default.nix
  ];

  # Enable Home Manager Packages
  home.packages = with pkgs; [
    # neovim
    # sway
    # waybar
    firefox
    git

  ripgrep #untuk Telescope neovim
  bat #cat yang lebih cantik, ketik bat namafile
  eza #ls lebih rapih, ketik exa #diganti menjadi eza
  fd #find yang lebih mudah, ketik fd --type query, juga dibutuhakah oleh nvim kickstart
  bottom #top yang lebih cantik, ketik btm

  ];

  services.copyq = {
    enable = true;
    systemdTarget = "sway-session.target";
  };

  # Set up Git
  # programs.git = {
  #   enable = true;
  #   userName = "My Name";
  #   userEmail = "myemail@example.com";
  # };

  # Enable Zsh and Oh My Zsh
  # programs.zsh.enable = true;
  # programs.oh-my-zsh = {
  #   enable = true;
  #   theme = "agnoster";  # Change to "powerlevel11k" if preferred
  #   plugins = [ "git" "zsh-autosuggestions" "zsh-syntax-highlighting" ];
  # };

  # Configure Kitty Terminal
  # programs.kitty = {
  #   enable = true;
  #   # font.name = "JetBrainsMono Nerd Font";
  #   # font.size = 12;
  # };

  # Enable Waybar
  # programs.waybar.enable = true;

  # Enable MPV Configuration
  # programs.mpv.enable = true;

  # Import application-specific configurations
  # imports = [
  #   ./kitty.nix
  #   ./zsh.nix
  #   ./waybar.nix
  # ];

  # Set environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Define Home Manager state version
  home.stateVersion = "23.11";
}
