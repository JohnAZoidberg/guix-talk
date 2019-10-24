(use-modules (guix packages)
             (guix download)
             (guix git-download)
             (guix build-system gnu)
             (guix build-system cmake)
             (guix licenses)
             (gnu packages pkg-config) 
             (gnu packages pcre)
             (gnu packages tex))

(define pplatex
  (package
    (name "pplatex")
    (version "1.0-rc2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stefanhepp/pplatex.git")
                    (commit (string-append name "-" version))))
              (file-name (git-file-name name version))
              (sha256
                (base32
                  "0xw7nvi2l15iyp9sm8vmmqghi54v99bcivqvx89f5v2gw0kw47k3"))))
    (build-system cmake-build-system)
    (arguments
      `(#:tests? #f
        #:phases
        (modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                   (invoke "install" "-D" "src/pplatex"
                           (string-append out "/bin/pplatex"))))))))
    (inputs
      `(("pkg-config" ,pkg-config)
        ("pcre" ,pcre)))
    (synopsis "Reformat the output of latex and friends into readable messages")
    (description "LaTeX is able to produce really nice document layouts. But it
                 is also able to produce a lot of noise on the command line.
                 pplatex is a command-line tool that parses the logs of latex
                 and pdflatex and prints warnings and errors in an human
                 readable format.")
    (home-page "https://github.com/stefanhepp/pplatex")
    (license gpl3+)))

(package
  (name "guix-talk")
  (version "1.0.0")
  (source (getcwd))
  (build-system gnu-build-system)
  (inputs 
    `(("pplatex" ,pplatex)
      ("texlive" ,texlive)))
  (arguments
    `(#:phases
      (modify-phases %standard-phases
        (delete 'configure)
        ;; We could be building from an unclean directory, so remove intermediate files first
        (add-before 'build 'clean
          (lambda _
            (invoke "make" "clean")))
        (replace 'install
          (lambda* (#:key outputs #:allow-other-keys)
            (let ((out (assoc-ref outputs "out")))
                 (invoke "install" "-D" "presentation.pdf" out)))))))
  (synopsis "Peering into the land of parentheses")
  (description "")
  (home-page "https://github.com/JohnAZoidberg/guix-peering")
  (license gpl3+))
