{pkgs, ...}: {
  # Video Drivers
  hardware = {
    amdgpu = {
      opencl.enable = true;
      initrd.enable = true;
      # amdvlk = {
      #   enable = true;
      #   support32Bit.enable = true;
      # };
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libva-vdpau-driver
        libvdpau-va-gl
        rocmPackages.clr.icd # AMD required pkg
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        libva-vdpau-driver
        libvdpau-va-gl
        # rocmPackages.clr.icd # AMD required pkg
      ];
    };
  };
  # GPU Settings RX 7800XT
  boot.kernelModules = ["amdgpu"];
  environment.systemPackages = with pkgs; [
    rocmPackages.clr.icd
    gpu-screen-recorder-gtk # GUI app
  ];
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  # nixpkgs.config.rocmSupport = true;
  programs.gpu-screen-recorder.enable = true;
}
