let
  pins = import ../npins;
in

{
  pkgs,

  git-hooks ? import pins.git-hooks,
}:

git-hooks.run {
  src = ./.;
  hooks = {
    treefmt.enable = true;
  };

  tools = {
    treefmt = import ./treefmt.nix pkgs;
  };
}
