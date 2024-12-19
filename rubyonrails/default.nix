{ pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        ruby
        libz
        libffi
        libyaml
    ];
}
