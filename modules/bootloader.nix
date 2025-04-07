{ pkgs, ... }: 
{

boot = {
        loader = {    
            # systemd-boot.enable = false;
            # systemd-boot.editor = false;
            # systemd-boot.configurationLimit = 10;
            efi.canTouchEfiVariables = true;
            efi.efiSysMountPoint = "/boot/efi";
            grub = {
                enable = true;
                # device = "/dev/sda";
                device = "nodev";
                useOSProber = false;
                copyKernels = true;
                efiSupport = true;
                # useOSProber = false;
                splashImage = null;
                # default = "Arch Linux (on /dev/sda4)";
                # extraEntries = ''
                #      menuentry "FreeBSD 14.2" {
                #             insmod ufs2
                #             set root=(hd0,gpt5)
                #             chainloader +1
                #      }
                # '';
                extraEntries = ''
                  menuentry "Arch Linux" {
                       insmod ext2
                       search --no-floppy --fs-uuid --set=root 95f9519a-f49c-4953-a8db-36609a505c07
                       linux /boot/vmlinuz-linux root=UUID=95f9519a-f49c-4953-a8db-36609a505c07 rw
                       initrd /boot/initramfs-linux.img
                  }
                  menuentry "FreeBSD" {
                      insmod ufs2
                      search --no-floppy --fs-uuid --set=root 67d0a366af5a5007
                      chainloader /boot/loader.efi
                  }
                  '';
            };
            timeout = 5;
            # grub.menuEntries = [
            #   {
            #     title = "FreeBSD";
            #     linux = "/boot/loader/entries/freebsd.conf";
            #     initrd = "/boot/loader/entries/initramfs.img";
            #     options = "root=UUID=67cc5e8db0313f24";
            #   }
            # ];
            ## after rebuild: please run this two line of code, 
            ## so the timeout will reset:
            # sudo bootctl set-default ""
            # sudo bootctl set-timeout ""
        };

        # bootspec.enable = true;
        # Use latest linux kernel
        kernelPackages = pkgs.linuxPackages_latest;
        # kernelPackages = pkgs.linuxKernel.packages.linux_testing;
        # kernelPackages = pkgs.linuxKernel.packages.linux_6_5;
        # kernelPackages = pkgs.linuxKernel.packages.linux_zen;
        # kernelPackages = pkgs.linuxPackages_zen;
        # kernelPackages = pkgs.linuxKernel.packages.linux_xanmod;
        # kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
        # kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_stable;
        # kernelPackages = pkgs.linuxKernel.packages.linux_lqx;
        
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
        # plymouth.enable = true;
    };

  # A DBus service that allows applications to update firmware
  services.fwupd.enable = true;

  systemd.watchdog.rebootTime = "0";

  systemd.services = {
    # if you not using GDM or ZFS enable this for faster boot time
    # systemd-udev-settle.enable = false; #not recommended

    systemd-tmpfiles-setup.before = [ "sysinit.target"];
    systemd-update-utmp.after = [ "systemd-tmpfiles_setup.service"];

    # NetworkManager-wait-online.enable = false;
  };
}
