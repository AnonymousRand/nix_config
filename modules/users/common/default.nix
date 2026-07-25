{ den, ... }: {
  den.schema.user = { user, ... }: {
    # change default aspect name associated with user entities to fit our naming scheme
    aspect = den.aspects.users.${user.name};

    includes = [
      den.batteries.define-user
    ];
  };

  # note: this aspect must be manually imported in each host *aspect*, i haven't found another way
  den.aspects.users.common = {
    # aspects to be included in every user entity
    includes = [];

    homeManager = {
      # enables standalone `home-manager` command
      programs.home-manager.enable = true;
    };
  };
}
