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
      lib.mkMerge [
        (lib.mkIf printingSettings.enablePrinting {
          services.printing = {
            enable = true;
            drivers = printerPackages;
          };
        })

        (lib.mkIf printingSettings.enableScanning {
          hardware.sane = {
            enable = true;
            extraBackends = printerPackages;
          };

          environment.systemPackages = [
            pkgs.simple-scan
            # may be needed for older, non-ipp printers
            pkgs.cups-filters
          ];
        })

        (lib.mkIf printingSettings.enableWireless {
          services.avahi = {
            enable = true;
            nssmdns4 = true;
            openFirewall = true;
          };
        })

        {
          users.users =
            let
              combinedUsers =
                printingSettings.printingUsers ++ printingSettings.scanningUsers;
              getGroups = user:
                (lib.optionals (builtins.elem user printingSettings.printingUsers) [
                  "lp"
                ])
                ++ (lib.optionals (builtins.elem user printingSettings.scanningUsers) [
                  "scanner"
                ]);
            in
            lib.genAttrs combinedUsers (user: {
              extraGroups = getGroups user;
            });
        }
      ];
  };
}
