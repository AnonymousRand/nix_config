{ den, ... }: {
  den.schema.user = {
    # aspects to be included in every user entity
    includes = [
      den.batteries.define-user
    ];

    homeManager = {
      # enables standalone `home-manager` command
      programs.home-manager.enable = true;
    };
  };
}
