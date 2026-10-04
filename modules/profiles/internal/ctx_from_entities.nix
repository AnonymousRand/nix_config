{ den, lib, ... }: {
  # allow user and home entities to override profile-schema options (see policies)
  #
  # currently commented out since it does cause issues where if some options are not set in the
  # user/home entity, then the merged `profile` context arg will not have it set either instead of
  # defaulting to the profile entity's version. this is probably because we're using
  # `lib.recursiveUpdate` instead of `lib.mkMerge` in the policies; `lib.mkMerge` has problems of
  # its own, whereas schemas are freeform so we don't technically need to declare the options
  # that we set. tl;dr we can still override settings without these schema imports
  #den.schema.user.imports = [ den.schema.profil ];
  #den.schema.home.imports = [ den.schema.profil ];

  den.policies.user-to-profile = { user, ... }: [
    (den.lib.policy.resolve {
      # `lib.mkMerge` doesn't seem to work, hence `recursiveUpdate`; with the more specific
      # entity taking precedence over the general profile entity
      profile = lib.recursiveUpdate (den.profiles.${user.name} or {}) user;
    })
  ];

  den.policies.home-to-profile = { home, ... }: [
    (den.lib.policy.resolve {
      profile = lib.recursiveUpdate (den.profiles.${home.userName} or {}) home;
    })
  ];

  den.schema.user.includes = [ den.policies.user-to-profile ];
  den.schema.home.includes = [ den.policies.home-to-profile ];
}
