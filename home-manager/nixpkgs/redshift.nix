{config, ...}:
let paris_location = {
  latitude = 48.8;
  longitude = 2.33;
  };
in
{
  services.redshift = {
    enable = true;
    inherit (paris_location) latitude;
    inherit (paris_location) longitude;
    provider = "manual";
    tray = true;
  };
}
