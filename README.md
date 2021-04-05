# nixpkgs-terraform - terraform-related packages with Nix.

**STATUS: experimental**

This is basically a fork of nixpkgs' terraform.

Sometimes it's nice to select the terraform and providers without bumping
nixpkgs. Since go is fast to compile and the API is stable it should work well
with older versions of nixpkgs.

The side-goal is also to explore the packaging of terraform and then get it
back into nixpkgs.

## Using with niv

```console
$ niv add numtide/nixpkgs-terraform
```

Then plug it in. Make sure to inject your instance of nixpkgs to avoid yet
another instance of nixpkgs.

```nix
{ system ? builtins.currentSystem }:
let
  sources = import sources.nix;
  
  pkgs = import sources.nixpkgs { config = { }; overlays = [ ]; };

  nixpkgs-terraform = import sources.nixpkgs-terraform { inherit pkgs; };
in
# ...
null
```

## Things I want to research

1. Expose the terraform builder to make it easier to build custom versions of
  terraform.
2. Expose the terraform-provider builder. Same reason.
3. Automate the update of terraform and its providers.

## License

Same as nixpkgs.
