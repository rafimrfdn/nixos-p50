{ pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        libz
        libffi
        libyaml
    ];
}
