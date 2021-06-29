{ nixosConfig, ... }:
let
  inherit (builtins) attrNames filter readDir match concatStringsSep;

  wlanifs = filter
    (str: (match "wl\.+" str) != null)
    (attrNames nixosConfig.networking.interfaces);

  wirelessConfigs = concatStringsSep "\n"
    (map
      (ifname:
        ''
          , Run Wireless "${ifname}"
            [ "-p","3"
            , "-t","<fc=#f0dfaf>Wlan:</fc> <essid>[<quality>%]"
            ] 10
        ''
      )
      wlanifs);

  wirelessComps = concatStringsSep " | " (map (ifname: "%${ifname}wi%") wlanifs);
in
''
  Config
    { font = "xft:DejaVu Sans Mono:size=11:bold:antialias=true"
    , bgColor  = "#3f3f3f"
    , fgColor  = "#dcdccc"
    , position = TopW L 100
    , lowerOnStart = True
    , commands =
      [ Run Date "%a %b %_d %H:%M" "date" 10
      , Run BatteryN ["BAT0"]
        [ "-p","3"
        , "-t","<fc=#f0dfaf>Batt:</fc> <left>%"
        ] 10 "battery"
      ${wirelessConfigs}
      , Run StdinReader
      ]
    , sepChar  = "%"
    , alignSep = "}{"
    , template = "%StdinReader% }{ ${wirelessComps} | %battery%    <fc=#dfaf8f>%date%</fc>"
    }
''
