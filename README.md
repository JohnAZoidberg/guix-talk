# Presentation Template using LaTeX

## Usage
### Continuous development
1. Install a LaTeX distribution with pplatex or `nix-shell`.
2. `make` as often as you like while changing source
3. Have your favourite PDF reader reload the `presentation.pdf` automatically

### Final package
1. `nix-build`
2. Open `result/presentation.pdf` in your favourite PDF reader

### Tweaks
- Uncomment `, handout` to combine animations ("overlays") into single slide
- Unocmment `\setbeameroption{show notes on second screen}` to enable speaker notes
