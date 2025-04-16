pkgs:

let
  pins = import ../npins;
  treefmt-nix = import pins.treefmt-nix;
in

treefmt-nix.mkWrapper pkgs {
  projectRootFile = ".git/config";

  programs = {
    mix-format.enable = true;
    nixfmt-rfc-style.enable = true;
  };

  settings.formatter = {
    nixfmt-rfc-style.excludes = [ "npins/*" ];
  };
}
