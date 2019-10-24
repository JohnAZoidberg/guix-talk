with import <nixpkgs> {};

let
  latexPackage = texlive.combined.scheme-full;
  foo = texlive.combine {
    inherit (texlive)
      scheme-small

      latexmk

      beamer
      beamertheme-metropolis
      appendixnumberbeamer
      ccicons
      pgfopts
      pgfplots

      biber
      biblatex
      biblatex-apa
      csquotes
      logreq
      xstring

      soul
      minted

      siunitx  
      ;
  };

  pplatex =
    stdenv.mkDerivation rec {
      pname = "pplatex";
      version = "1.0-rc2";

      src = fetchFromGitHub {
        owner = "stefanhepp";
        repo = "pplatex";
        rev = "${pname}-${version}";
        sha256 = "0xw7nvi2l15iyp9sm8vmmqghi54v99bcivqvx89f5v2gw0kw47k3";
      };

      buildInputs = [ cmake pkgconfig pcre ];

      installPhase = ''
        install -D src/pplatex $out/bin/pplatex
      '';
    };
in
  stdenv.mkDerivation rec {
    name = "guix-talk";

    src = ./.;

    buildInputs = [
      latexPackage pplatex
      pythonPackages.pygments
      #pdfpc
    ];

    # We could be building from an unclean directory, so remove intermediate files first
    preBuild = "make clean";

    installPhase = ''
      install -D presentation.pdf $out
    '';

    doCheck = true;
  }
