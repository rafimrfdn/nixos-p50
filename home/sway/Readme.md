# about this sway config

Finally I know how to setup Sway in Nixos.

This config comes with define the "modifier" first, so it will replace the default "keybindings" config (Mod1).

Important note for this config:
1. make sure to set the "modifier" at the config block.
2. make sure to set the "keybindings" at the config then set the important keybind for navigate
3. then I must have the **config-early** file, this will render the config before enter the default config.
4. then I must have the **config-after** file, this will render after the default config.

you can check the generated config after your system rebuild at `~/.config/sway/config`
