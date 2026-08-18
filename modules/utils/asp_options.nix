{ den, lib, ... }:
let
  aspOptionsFwd = targetClasses: { class, aspect-chain }: den.batteries.forward {
    each = targetClasses;
    fromClass = _: "aspOptions";
    intoClass = lib.id;
    intoPath = _: [ "options" ];
    fromAspect = _: lib.head aspect-chain;
  };

  aspConfigFwd = targetClasses: { class, aspect-chain }: den.batteries.forward {
    each = targetClasses;
    fromClass = _: "aspConfig";
    intoClass = lib.id;
    intoPath = _: [ "config" ];
    fromAspect = _: lib.head aspect-chain;
  };
in
{
  den.schema.host.includes = [
    ({ host }: aspOptionsFwd [ host.class ])
    ({ host }: aspConfigFwd  [ host.class ])
  ];

  den.schema.user.includes = [
    ({ host, user }: aspOptionsFwd ([ host.class ] ++ user.classes))
    ({ host, user }: aspConfigFwd  ([ host.class ] ++ user.classes))
  ];

  den.schema.home.includes = [
    ({ home }: aspOptionsFwd [ home.class ])
    ({ home }: aspConfigFwd  [ home.class ])
  ];
}
