{pkgs, ...}: {
  # Video Drivers
  hardware = {
    amdgpu.opencl.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        rocmPackages.clr.icd # AMD required pkg
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        vaapiVdpau
        libvdpau-va-gl
        rocmPackages.clr.icd # AMD required pkg
      ];
    };
  };
  # GPU Settings RX 7800XT
  environment.systemPackages = with pkgs; [
    rocmPackages.clr.icd
  ];
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  nixpkgs.config.rocmSupport = true;
}
