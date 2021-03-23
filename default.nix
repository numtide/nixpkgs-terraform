{ pkgs ? import <nixpkgs> { inherit system; config = { }; overlays = [ ]; }
, system ? builtins.currentSystem
}:
rec {
  terraform-docs = pkgs.callPackage ./terraform-docs { };
  terraform-providers = pkgs.callPackage ./terraform-providers { };

  inherit (pkgs.callPackage ./terraform { inherit terraform-providers; })
    terraform_0_12
    terraform_0_13
    terraform_0_14
    terraform_plugins_test
    ;

  terraform = terraform_0_14;
}
