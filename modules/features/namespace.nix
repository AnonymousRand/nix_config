{ inputs, ... }: {
  imports = [
    # create a namespace `features` under which we can define aspects as `features.<aspect name>`
    # this gives us a convenient way to group together related aspects (e.g. features, hosts, users)
    # (the `false` means this namespace is only consumed internally and not exposed in flake outputs)
    (inputs.den.namespace "features" false)
  ];
}
