{ den, ... }:
let
  hostname = "snow-rainbow";
in
{
  # declare users on this host
  den.hosts.x86_64-linux.${hostname} = {
    users = {
      meow = {
        # enable integrated home manager
        # (specifically, it allows a `homeManager= {};` class module in the user's aspect, which is
        # forwarded to `home-manager.users.<username>` as with usual integrated home manager configs)
        classes = [ "homeManager" ];
      };
    };
  };

  # enable standalone home manager for users on this host
  # (standalone and integrated home manager entities both pull from `den.aspects.user.<username>`)
  # (snow-rainbow is a fully fledged nixos host so this is mainly for testing standalones)
  den.homes.x86_64-linux = {
    # by specifying both username and hostname, we automatically tie this to the user aspect
    # (and also allows you to invoke standalone home manager with just `home-manager switch`)
    "meow@${hostname}" = {};
  };

  den.aspects.hosts.${hostname} = {
    # aspects to be included on this host regardless of user
    includes = [
      den.aspects.hosts.base

      den.aspects.features.system.dual-boot
      den.aspects.features.system.firmware
      den.aspects.features.system.nixowos

      # (note that greeter can manage different WMs/DEs per user)
      den.aspects.features.desktop.noctalia-greeter

      den.aspects.features.tools.nvtop     # `top` for GPUs
      den.aspects.features.tools.playerctl # control media players that use MPRIS
      den.aspects.features.tools.solaar    # logitech mouse config
      den.aspects.features.tools.tokei

      den.aspects.features.apps.firefox

      {


    aspOptions = {
      hi = "sd";
    };
      }
    ];
  };
}
