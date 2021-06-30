{ config, lib, ... }:

let
  getName = drv:
    if builtins.hasAttr "pname" drv
    then drv.pname
    else if builtins.hasAttr "name" drv
    then (builtins.parseDrvName drv.name).name
    else throw "Cannot figure out name of: ${drv}";
in
{
  nixpkgs.config = rec {
    allowUnfreePredicate = lib.mkDefault (pkg:
      builtins.elem (getName pkg) allowUnfreeWhitelist
    );

    allowUnfreeWhitelist = lib.mkOption {
      description = "A whitelist of allowed unfree packages";
      type = with lib.types; listOf string;
    };
  };
}
