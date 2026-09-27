{
  description = "Revival of CLOCC PORT's portable shell.lisp and sys.lisp.";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/e158d9ed9b51c98974c5e66e1ba1c9e0255fecaa";
  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAll = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in {
      packages = forAll (pkgs: with pkgs; rec {
        newport = sbcl.buildASDFSystem {
          pname = "newport";
          version = "1.0";
          src = (lib.cleanSourceWith { src = self; filter = p: _: !(lib.hasSuffix ".fasl" p || lib.hasPrefix ".#" (baseNameOf p)); });
          systems = [ "newport" ];
          lispLibs = [ sbclPackages.alexandria ];
          postPatch = "sed -i 's|(#:alexandria #:uiop)|(#:alexandria #:uiop #:sb-posix)|' newport.asd";
          meta = { description = "Revival of CLOCC PORT's portable shell.lisp and sys.lisp."; homepage = "https://github.com/equwal/Newport"; license = lib.licenses.lgpl21; };
        };
        default = newport;
        # an SBCL with this system (and its dependencies) preloaded: `nix run .#sbcl`
        sbcl-with = sbcl.withPackages (ps: [ newport ]);
      });
      apps = forAll (pkgs: {
        sbcl = { type = "app"; program = "${self.packages.${pkgs.system}.sbcl-with}/bin/sbcl"; };
      });
    };
}
