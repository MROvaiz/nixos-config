{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    btop
    nvtopPackages.amd
  ];
}
