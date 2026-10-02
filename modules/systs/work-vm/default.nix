{ den, ... }:
let
  hostname = "work-vm";
  system = "x86_64-linux";
in
{
  #den.homes = {
  #  "meow@${hostname}" = { inherit system; };
  #};

  #den.aspects.systs.${hostname} = {
  #  includes = [
  #    den.aspects.systs.base
  #  ];
  #};
}
