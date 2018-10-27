{ nixpkgs ? (builtins.fetchGit {
    url = git://github.com/NixOS/nixpkgs-channels;
    ref = "nixos-18.09";
    rev = "09195057114a0a8d112c847a9a8f52957420857d";
  })
}:
let
  overlays = [ ];
  config = { };
  pkgs = import nixpkgs { inherit config overlays; };
  pyPkgs = pkgs.python3Packages;
in with pkgs; rec {
  bar = pyPkgs.buildPythonPackage rec {
    name = "bar";
    src = (builtins.fetchGit ./.)+"/bar" ;
    checkInputs = with pyPkgs; [
      pytest
      pytestrunner
    ];
  };
  foo = pyPkgs.buildPythonPackage rec {
    name = "foo";
    src = (builtins.fetchGit ./.)+"/foo" ;
    propagatedBuildInputs = with pyPkgs; [
      bar
    ];
    checkInputs = with pyPkgs; [
      pytest
      pytestrunner
    ];
  };
}
