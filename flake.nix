{
  description = "ags config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells."x86_64-linux".default =
      pkgs.mkShell { 
        packages = [
          pkgs.vscode-langservers-extracted
          pkgs.python312Packages.python-lsp-server
          pkgs.python312
        ];
      };
  };
}
