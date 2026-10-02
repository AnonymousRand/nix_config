{ den, ... }: {
  den.homes = {
    "meow@work-vm" = {
      system = "x86_64-linux";
    };
  };

  den.aspects.user-home."meow@work-vm" = {
    includes = [
      den.aspects.user-home.base
    ];
  };
}
