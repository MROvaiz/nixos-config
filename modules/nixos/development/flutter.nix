{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    flutter
  ];
}
