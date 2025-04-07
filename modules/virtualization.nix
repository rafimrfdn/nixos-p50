{
# Virtualization with qemu kvm
    virtualisation = {
        libvirtd.enable = true;
        # docker = {                      # Enable Docker
        #         enable = true;
        #         rootless = {            # this will run docker without root access
        #             enable = true;
        #             setSocketVariable = true;
        #         };
        #     };
        };
    programs.virt-manager.enable = true;

}
