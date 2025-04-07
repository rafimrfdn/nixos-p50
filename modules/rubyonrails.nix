{ pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        ruby
        libz
        libffi
        libyaml
    ];

    environment = {
        variables = {
            PATH = "$HOME/.local/share/gem/ruby/3.3.0/bin";  # ruby needs to set manualy the env variable like this.
        };
    };
}
