# reference from youtube:https://www.youtube.com/watch?v=nJ6glhP7JI0

{config, pkgs, ...}:

{
    boot = {
        loader = {    
            systemd-boot.enable = true;
            systemd-boot.editor = false;
            systemd-boot.configurationLimit = 10;
            efi.canTouchEfiVariables = true;
            efi.efiSysMountPoint = "/boot/efi";
            # grub = {
            #     enable = true;
            #     device = "/dev/sda";
            #     copyKernels = true;
            #     # useOSProber = false;
            #     splashImage = null;
            # };
            timeout = 0;
            ## after rebuild: please run this two line of code, 
            ## so the timeout will reset:
            # sudo bootctl set-default ""
            # sudo bootctl set-timeout ""
        };

        # bootspec.enable = true;
        # Use latest linux kernel
        # kernelPackages = pkgs.linuxPackages_latest;
        # kernelPackages = pkgs.linuxKernel.packages.linux_6_5;
        # kernelPackages = pkgs.linuxKernel.packages.linux_zen;
        # kernelPackages = pkgs.linuxPackages_zen;
        # kernelPackages = pkgs.linuxKernel.packages.linux_xanmod;
        kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
        # kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_stable;
        
        # silent boot. 
        kernelParams = [
            # "quiet"
            # "splash"
            # "vga=currrent"
            # "rd.systemd.show_status=false"
            # "rd.udev.log_level=3"
            # "udev.log_priority=3"
            "nohibernate"

            # Enable framebuffer compression (FBC)
            # can reduce power consumption while reducing memory bandwidth needed for screen refreshes.
            # https://wiki.archlinux.org/index.php/intel_graphics#Framebuffer_compression_(enable_fbc)
            "i915.enable_fbc=1" 
        ];

        consoleLogLevel = 0;

        initrd = {
            verbose = false;
            systemd = {
                # enable = false;
                dbus.enable = true; # coba aktifkan ini instead of pakai # services.dbus.enable = true;
            };
            # https://wiki.archlinux.org/index.php/Kernel_mode_setting#Early_KMS_start
            kernelModules = [ "i915" ];
        };
        supportedFilesystems = ["ntfs"];
        
        #christitus nixos config
        tmp.cleanOnBoot = true;

        # Silent boot to hide Stage when boot system and show the splash screen
        plymouth.enable = true;
    };
    
  # A DBus service that allows applications to update firmware
  services.fwupd.enable = true;

  systemd.watchdog.rebootTime = "0";

  systemd.services = {
    # if you not using GDM or ZFS enable this for faster boot time
    # systemd-udev-settle.enable = false; #not recommended

    systemd-tmpfiles-setup.before = [ "sysinit.target"];
    systemd-update-utmp.after = [ "systemd-tmpfiles_setup.service"];

    NetworkManager-wait-online.enable = false;
  };
}

