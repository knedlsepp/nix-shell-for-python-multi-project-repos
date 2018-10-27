{ nixpkgs ? <nixpkgs> }:
let
  multiShell = import ./multiShell.nix { inherit nixpkgs; };
  repos = (import ./default.nix { inherit nixpkgs; });
in multiShell [
  { dir = "bar"; pkg = repos.bar; }
  { dir = "foo"; pkg = repos.foo; }
]