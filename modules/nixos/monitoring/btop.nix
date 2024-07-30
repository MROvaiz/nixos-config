{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # (btop.override {rocmSupport = true;})
    btop
    nvtopPackages.amd
  ];
}
