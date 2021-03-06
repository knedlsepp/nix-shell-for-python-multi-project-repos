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
    src = if lib.inNixShell then null else (builtins.fetchGit {
      url = ./.;
      ref = "HEAD";
    })+"/bar";
    checkInputs = with pyPkgs; [
      pytest
      pytestrunner
    ];
  };
  foo = pyPkgs.buildPythonPackage rec {
    name = "foo";
    src = if lib.inNixShell then null else (builtins.fetchGit {
      url = ./.;
      ref = "HEAD";
    })+"/foo";
    propagatedBuildInputs = with pyPkgs; [
      bar
    ];
    checkInputs = with pyPkgs; [
      pytest
      pytestrunner
    ];
  };
}
