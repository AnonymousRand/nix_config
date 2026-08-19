{ den, lib, ... }:
let
  keyName = "aspOptions";
in
{
  den.reservedKeys = [ "${keyName}" ];

  # generator
  den.schema.conf =
    let
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
            builtins.trace "hasAspOptionsDeep? ${lib.boolToString (
              builtins.isAttrs node && (
                (node ? "${keyName}") || lib.any
                  (k: !(skipKey k) && hasAspOptionsDeep (node.${k} or null))
                  (builtins.attrNames node)
              )
            )}" (
            builtins.isAttrs node && (
              (node ? "${keyName}") || lib.any
                (k: builtins.trace "testing subnode ${k}" (!(skipKey k) && hasAspOptionsDeep (node.${k} or null)))
                (builtins.attrNames node)
            ));

          # build the options submodule for one aspect-tree node, mirroring what is declared in
          # the aspect's `aspOptions`
          nodeModule = node: builtins.trace "Sds" (
            let
              ownAspOptions =
                if node ? "${keyName}" then
                  builtins.trace "FOUND ONE!" node.${keyName}
                else {};

              childrenWithAspOptions = builtins.trace (builtins.attrNames node) lib.filterAttrs (
                k: v: builtins.trace "detecting children on node node ${k}" (!(skipKey k) && builtins.isAttrs v && hasAspOptionsDeep v)
                #k: v: !(skipKey k) && builtins.isAttrs v && hasAspOptionsDeep v
              ) node;

              #childrenAspOptions = builtins.trace "# children is ${builtins.toString (builtins.length (builtins.attrNames childrenWithAspOptions))}" lib.mapAttrs (name: child:
              #  lib.mkOption {
              #    type = builtins.trace "adding option for ${name} of type submodule" lib.types.submodule (nodeModule child);
              #    default = {};
              #  }
              #) childrenWithAspOptions;
            in
              builtins.trace "# children is ${builtins.toString (builtins.length (builtins.attrNames childrenWithAspOptions))}" (lib.foldlAttrs (acc: name: child: builtins.trace acc acc // (nodeModule child)) ownAspOptions childrenWithAspOptions)
            );
            #lib.mkMerge ownAspOptions childrenAspOptions;
        in
        lib.types.submodule {
          options = nodeModule (den.aspects or {});
        };
        #builtins.trace (lib.types.submodule (nodeModule (den.aspects or {}))) (lib.types.submodule (nodeModule (den.aspects or {})));
    in
    {
      imports = [
        ({ config, ... }: {
          options.aspConfig = lib.mkOption {
            type = aspOptionsSubmod;
            default = {};
          };
        })
      ];
    };
}
