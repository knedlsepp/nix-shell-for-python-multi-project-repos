{ nixpkgs ?  <nixpkgs>}:
let
  pkgs = import nixpkgs {};
in
dirs_pkgs: (pkgs.mkShell {
  inputsFrom = pkgs.lib.catAttrs "pkg" dirs_pkgs;
  shellHook = pkgs.lib.concatMapStrings (dir_pkg: ''
    pushd ${dir_pkg.dir}
    ${dir_pkg.pkg.shellHook}
    popd
  '') dirs_pkgs;
}).overrideAttrs(o: 
  let
    removeLocal = pkgs.lib.subtractLists (pkgs.lib.catAttrs "pkg" dirs_pkgs);
  in rec {
    buildInputs = removeLocal o.buildInputs;
    nativeBuildInputs = removeLocal o.nativeBuildInputs;
    propagatedBuildInputs = removeLocal o.propagatedBuildInputs;
    propagatedNativeBuildInputs = removeLocal o.propagatedNativeBuildInputs;
})