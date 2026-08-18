{ den, meow, ... }:
let
  aspectName = "compile-scss";
in
{
  meow.utils.theme.${aspectName} = {
    includes = [
      den.aspects.utils.theme.${aspectName}
    ];

    homeManager = {
      utils.theme.${aspectName} = {
        pathsToCompile = [ ../../features ./base_scss ];
        pathsToLoad = [ ./base_scss ];
      };
    };
  };
}
