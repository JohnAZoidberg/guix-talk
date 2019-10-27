# Guix Talk at NixCon 2019

The pre-built PDF is available as a GitHub [release](https://github.com/JohnAZoidberg/guix-talk/releases/download/final-talk/guix-talk.pdf).

## Title
Peering into the Land of Parentheses - Guix from the Nix Perspective

## Abstract
Nix has a sibling, which looks very different, but functions in a very similar manner - Guix of the GNU project.
This talk will explore what exactly it is and, in particular, how it compares to Nix.
We look at whether Nix can take some inspiration from it and whether it is useful as a complimentary tool.

## Description
Guix's principles are aligned with those of Nix, but the language it uses to define derivations, as well as the commandline it is controlled with, are vastly different.
After an introduction into using Guix as a Nix user, we evaluate which lessons Nix can learn from its younger relative.

The original author of Guix had been a contributor to nixpkgs but nowadays there is little community interaction between both projects.
Can we work together and benefit from each other's knowledge and hard work?

Do both systems compliment each other and would it be useful to have both installed?

## Usage
The presentation can be built using a regular distribution and package manager, or using either Nix or Guix.

### Continuous development
1. Install a LaTeX distribution with pplatex or `nix-shell` or `guix environment -i presentation.scm`.
2. `make` as often as you like while changing source
3. Have your favourite PDF reader reload the `presentation.pdf` automatically

### Final package
1. `nix-build` or `guix build -f presentation.scm`
2. Open the output path in your favourite PDF reader

### Tweaks
- Uncomment `, handout` to combine animations ("overlays") into single slide
- Unocmment `\setbeameroption{show notes on second screen}` to enable speaker notes
