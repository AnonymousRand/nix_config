{ den, ... }: {
  den.schema.host = { lib, ... }: {
    options.settings.printing = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enablePrinting = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };

          enableScanning = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };

          enableWireless = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };

          printerModels = lib.mkOption {
            type = lib.types.listOf (lib.types.enum [ "hp" ]);
            default = [];
          };

          printingUsers = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
          };

          scanningUsers = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
          };
        };
      };

      default = {};
    };
  };

  den.aspects.host-settings.printing = {
    nixos = { host, lib, pkgs, ... }:
      let
        printingSettings = host.settings.printing;
        printerPackages =
          (lib.optionals (builtins.elem "hp" printingSettings.printerModels) [
            pkgs.hplipWithPlugin
          ]);
      in
      {
        services.printing = {
          enable = printingSettings.enablePrinting;
          drivers = printerPackages;
        };

        hardware.sane = {
          enable = printingSettings.enableScanning;
          extraBackends = printerPackages;
        };

        services.avahi = lib.mkIf printingSettings.enableWireless {
          enable = true;
          nssmdns4 = true;
          openFirewall = true;
        };

        environment.systemPackages =
          (lib.optionals printingSettings.enableScanning [
            pkgs.simple-scan
          ]);

        users.users =
          let
            combinedUsers =
              printingSettings.printingUsers ++ printingSettings.scanningUsers;
            getGroups = user:
              (lib.optionals (builtins.elem user printingSettings.printingUsers) [ "lp" ])
              ++ (lib.optionals (builtins.elem user printingSettings.scanningUsers) [ "scanner" ]);
          in
          lib.genAttrs combinedUsers (user: {
            extraGroups = getGroups user;
          });
      };
  };
}
