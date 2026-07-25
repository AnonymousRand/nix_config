{ den, ... }: {
  # note: this aspect must be manually imported in each host *aspect*, i haven't found another way
  den.aspects.users.base = {
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
