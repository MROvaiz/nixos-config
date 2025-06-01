{lib, ...}: {
  # Select internationalisation properties.

  i18n = {
    defaultLocale = lib.mkDefault "en_IN";
    extraLocaleSettings = {
      LANG = "en_US.UTF-8";
    };
  };
  location.provider = "geoclue2";
  time.timeZone = lib.mkDefault "Asia/Kolkata";
  # services.automatic-timezoned.enable = true;
}
