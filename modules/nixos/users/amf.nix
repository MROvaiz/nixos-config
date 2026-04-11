{config, ...}: {
  users.users = {
    amf = {
      description = "آيرا مهويش";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
      ];
    };
  };
}
