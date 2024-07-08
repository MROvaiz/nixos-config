{
  config,
  pkgs,
  ...
}: let
  # Use the path to the OpenVPN configuration
  username = config.sops.secrets."openvpn/username".path;
  password = config.sops.secrets."openvpn/password".path;
  usaConfig = "config /home/mro/Documents/ProtonVPN/us-free-197042.protonvpn.udp.ovpn";
  nlConfig = "config /home/mro/Documents/ProtonVPN/nl-free-142070.protonvpn.udp.ovpn";
in {
  environment.systemPackages = with pkgs; [
    openvpn
  ];
  services.openvpn.servers = {
    usa = {
      config = usaConfig;
      autoStart = false;
      updateResolvConf = true;
      authUserPass = {
        username = username;
        password = password;
      };
    };
    nl = {
      config = nlConfig;
      autoStart = false;
      updateResolvConf = true;
      authUserPass = {
        username = username;
        password = password;
      };
    };
  };
}
