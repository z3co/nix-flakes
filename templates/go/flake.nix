{
  description = "A simple go dev shell with zsh";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          name = "go-zsh";
          packages = with pkgs; [
            zsh
            go
            gopls
          ];
          shellHook = ''
            export SHELL=${pkgs.zsh}/bin/zsh
            exec ${pkgs.zsh}/bin/zsh
          '';
        };
        packages.default = pkgs.callPackage ./default.nix {};
      }
    );
}
