{
  description = "A basic flake with go and zsh";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		flake-parts.url = "github:hercules-ci/flake-parts";
  };

	outputs = inputs@{flake-parts, ...}:
		flake-parts.lib.mkFlake {inherit inputs;} {
			systems = [
				"x86_64-linux"
				"x86_64-darwin"
			];
			perSystem = {pkgs, ...}: {
				devShells.default = pkgs.mkShell {
					name = "go";
					packages = with pkgs; [
						go zsh
					];
					shellHook = ''
						export SHELL=${pkgs.zsh}/bin/zsh
						exec $SHELL
						'';
				};
			};

		};
}
