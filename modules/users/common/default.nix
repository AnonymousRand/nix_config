{ den, ... }: {
  den.schema.user = {
    # change default aspect name associated with user entities to fit our naming scheme
    aspect = den.aspects.users.${name};

    # aspects to be included in every user entity
    includes = [
      den.batteries.define-user

      {
        homeManager = {
          # enables standalone `home-manager` command
          programs.home-manager.enable = true;
        };
      }
    ];
  };
}
