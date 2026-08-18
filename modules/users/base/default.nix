{ den, ... }: {
  # note: this aspect must be manually imported in each host *aspect*, i haven't found another way
  den.aspects.users.base = {
    # aspects to be included in every user entity
    includes = [
      # set basic user info
      den.batteries.define-user
      # allows `homeManager` etc. class modules from hosts to be automatically forwarded to all
      # users on that host (which include this battery), without needing `provides.to-users`
      den.batteries.host-aspects

      den.aspects.features.fonts.fontconfig
    ];
  };
}
