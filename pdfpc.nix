with import <nixpkgs> {};
pkgs.pdfpc.overrideAttrs (old: {
  patches = [ ./pdfpdc-sameslide.patch ];
})
