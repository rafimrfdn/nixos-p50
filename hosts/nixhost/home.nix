{ config, pkgs, ... }:

{
  home.username = "nix";
  home.homeDirectory = "/home/nix";

  # Enable Home Manager Packages
  home.packages = with pkgs; [
    neovim
    sway
    waybar
  ];

  # Set up Git
  # programs.git = {
  #   enable = true;
  #   userName = "My Name";
  #   userEmail = "myemail@example.com";
  # };

  # Enable Zsh and Oh My Zsh
  programs.zsh.enable = true;
  # programs.oh-my-zsh = {
  #   enable = true;
  #   theme = "agnoster";  # Change to "powerlevel10k" if preferred
  #   plugins = [ "git" "zsh-autosuggestions" "zsh-syntax-highlighting" ];
  # };

  # Configure Kitty Terminal
  programs.kitty = {
    enable = true;
    # font.name = "JetBrainsMono Nerd Font";
    # font.size = 12;
  };

  # Enable Waybar
  programs.waybar.enable = true;

  # Enable MPV Configuration
  programs.mpv.enable = true;

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

  # Define Home Manager state version
  home.stateVersion = "23.11";
}
