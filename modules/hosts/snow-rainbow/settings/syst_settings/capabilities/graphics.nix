let
  systSettings.capabilities.graphics = {
    supported = true;

    displayOutputs = {
      "ASUSTek COMPUTER INC VG27A N7LMQS014382" = {
        resolution = {
          width = 2560;
          height = 1440;
        };
        refreshRate = 143.972;
        scale = 1.25;
        position = {
          x = 0;
          y = 0;
        };
      };

      "HP Inc. HP VH240a 6CM0211LWH" = {
        resolution = {
          width = 1920;
          height = 1080;
        };
        refreshRate = 60.0;
        scale = 1.0;
        position = {
          x = -1920;
          y = 0;
        };
      };
    };
  };
in
{
  den.hosts.x86_64-linux.snow-rainbow = { inherit systSettings; };

  den.homes.x86_64-linux = {
    "meow@snow-rainbow" = { inherit systSettings; };
  };
}
