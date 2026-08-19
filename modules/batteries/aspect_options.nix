{ den, lib, ... }:
let
  keyName = "aspOptions";

  # generator
  aspOptionsSubmod =
    let
      # these are keys that are NOT child aspects: structural keys (e.g. `includes`, `nixos`)
      # along with den's registered class names and quirk/extension keys
      inherit (den.lib.aspects.fx.keyClassification) structuralKeysSet;
      classKeys = den.classes or {};
      quirkKeys = den.quirks or {};
      skipKey = k: structuralKeysSet ? ${k} || classKeys ? ${k} || quirkKeys ? ${k};

      # `true` if this node, or anything beneath it, declares `aspOptions`
      hasAspOptionsDeep = node:
        builtins.isAttrs node && (
          (node ? "${keyName}") || lib.any
            (k: !(skipKey k) && hasAspOptionsDeep (node.${k} or null))
            (builtins.attrNames node)
        );

      # build the options submodule for one aspect-tree node, mirroring what is declared in
      # the aspect's `aspOptions` into schema's `options.aspConfig`
      nodeModule = node:
        let
          ownAspOptions =
            if node ? "${keyName}" then
              node.${keyName}
            else {};

          childrenWithAspOptions = builtins.attrValues (lib.filterAttrs (
            k: v: !(skipKey k) && builtins.isAttrs v && hasAspOptionsDeep v
          ) node);
        in
        builtins.foldl'
          (acc: child: acc // (nodeModule child))
          ownAspOptions childrenWithAspOptions;
    in
    lib.types.submodule {
      options = nodeModule (den.aspects or {});
    };
in
{
  den.reservedKeys = [ "${keyName}" ];

  den.schema.conf = {
    options.aspConfig = lib.mkOption {
      type = aspOptionsSubmod;
      default = {};
    };
  };

  den.policies.add-asp-config-ctx = { host ? null, user ? null, home ? null, ... }: [
    (den.lib.policy.resolve {
      aspConfig =
        if (host ? aspConfig) then
          host.aspConfig
        else (
          if (user ? aspConfig) then
            user.aspConfig
          else (
            if (home ? aspConfig) then
              home.aspConfig
            else
              throw "den.policies.add-asp-config-ctx: this shouldn't be possible!"
          )
        );
    })
  ];

  # (for some reason putting this into `den.schema.conf.includes` breaks)
  den.schema.host.includes = [ den.policies.add-asp-config-ctx ];
  den.schema.user.includes = [ den.policies.add-asp-config-ctx ];
  den.schema.home.includes = [ den.policies.add-asp-config-ctx ];
}
