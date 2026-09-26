{ den, ... }:
let
  hostname = "snow-rainbow";
  system = "x86_64-linux";
in
{
  # declare users on this host
  den.hosts.${hostname} = {
    inherit system;

    users = {
      meow = {
        # enable integrated home manager
        # (specifically, it allows a `homeManager= {};` class module in the user's aspect, which is
        # forwarded to `home-manager.users.<username>` like usual integrated home manager configs)
        classes = [ "homeManager" ];
      };
    };
  };

  # enable standalone home manager for users on this host, i.e. allows `home-manager switch`
  # standalone and integrated home manager entities both pull from `den.aspects.user.<username>`
  # (snow-rainbow is a fully fledged nixos host, so this is mainly for testing standalones)
  den.homes = {
    "meow@${hostname}" = { inherit system; };
  };

  den.aspects.hosts.${hostname} = {
    # aspects to be included on this host regardless of user
    includes = [
      den.aspects.features.system.dual-boot
      den.aspects.features.system.firmware
      den.aspects.features.system.nixowos

      # (note that greeter can manage different WMs/DEs per user)
      den.aspects.features.desktop.noctalia-greeter

      den.aspects.features.tools.solaar
    ];
  };
}
