{
  perSystem = { pkgs, ... }: {
    packages.default = pkgs.buildGoModule {
      pname = "name";
      version = "0.1.0";
      src = ./.;
      vendorHash = null;
    };

  };
}
