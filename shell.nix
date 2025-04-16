let
  pins = import ./npins;
  nixpkgs = import pins.nixpkgs {
    config = { };
    overlays = [ ];
  };
in

{
  pkgs ? nixpkgs,
}:

let
  treefmt = import ./nix/treefmt.nix pkgs;
  commitHooks = pkgs.callPackage ./nix/commit-hooks.nix { };
in
pkgs.mkShell {
  name = "base-devshell";
  packages = with pkgs; [
    just
    treefmt

    nixfmt-rfc-style
    nixd
    npins

    elixir
    elixir_ls
    inotify-tools
  ];

  shellHook = ''
    ${commitHooks.shellHook}
  '';
}
