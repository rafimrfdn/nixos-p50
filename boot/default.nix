# reference from youtube:https://www.youtube.com/watch?v=nJ6glhP7JI0

{config, pkgs, ...}:

{
  boot = {
    bootspec.enable = true;
    # Use latest linux kernel
    #kernelPackages = pkgs.linuxPackages_latest;
    #kernelPackages = pkgs.linuxKernel.packages.linux_6_5;
    #kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    kernelPackages = pkgs.linuxPackages_zen;

  loader = {    
    systemd-boot.editor = false;
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
    timeout = 0;
  };

  kernelParams = [
    "quiet"
    "splash"
    "vga=currrent"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
  ];
  consoleLogLevel = 0;
  initrd.verbose = false;
  supportedFilesystems = ["ntfs"];
  };
}
