{lib, ...}: {
  # Select internationalisation properties.

  i18n = {
    defaultLocale = lib.mkDefault "en_IN";
    extraLocaleSettings = {
      LANG = "en_US.UTF-8";
      LC_ADDRESS = "en_IN";
      LC_IDENTIFICATION = "en_IN";
      LC_MEASUREMENT = "en_IN";
      LC_MONETARY = "en_IN";
      LC_NAME = "en_IN";
      LC_NUMERIC = "en_IN";
      LC_PAPER = "en_IN";
      LC_TELEPHONE = "en_IN";
      LC_TIME = "en_IN";
    };
  };
  location.provider = "geoclue2";
  time.timeZone = lib.mkDefault "Asia/Kolkata";
  # services.automatic-timezoned.enable = true;
}
