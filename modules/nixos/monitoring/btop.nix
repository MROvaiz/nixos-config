{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (btop.override {rocmSupport = true;})
    nvtopPackages.amd
  ];
}
