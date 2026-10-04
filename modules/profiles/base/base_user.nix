{ den, ... }: {
  den.aspects.users.base = {
    includes = [
      # allows `homeManager` etc. class modules from hosts to be automatically forwarded to all
      # users on that host (which include this battery), without needing `provides.to-users`
      den.batteries.host-aspects
    ];
  };
}
