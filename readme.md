# Making a post about a new release

- Place the binaries and packages in the `download` folder.
  * `BNFC-${VER}.tar.gz`: Sources as produced by `cabal sdist`.
  * `BNFC-${VER}-mac.pkg`: Mac package, containing `/usr/local/bin/bnfc`.
  * `bnfc-${VER}-win.exe`: Windows executable.
  * `bnfc-${VER}-linux-x86_64.tar.gz`: Linux installer (64bit).
  * `bnfc-${VER}-linux-i386.tar.gz`: Linux installer (32bit).

- Run
  ```
  ./new-release -i <version>
  ```
  Option `-i` ignores missing binary distributions.

## Creating the mac.pkg

Place the `bnfc` binary in a directory `${ROOT}/usr/local/bin/`
where `${ROOT}` is a directory of your choice.
Run:
```
pkgbuild \
  --root ${ROOT} \
  --identifier com.digitalgrammars.bnfc.pkg \
  --version ${VER} \
  --install-location / \
  --ownership recommended \
  download/BNFC-${VER}-mac.pkg
```

# Testing this website

Have ruby installed (possibly with Ruby Version Manager).

- Install `bundler`:
  ```
  gem install jekyll bundler
  ```
  If this does not work (e.g. on Mac because of missing permissions), try:
  ```
  bundle update --bundler
  ```

- Start the server:
  ```
  bundle exec jekyll serve
  ```
  This should serve the site at http://127.0.0.1:4000 .

# Authors of BNFC

Dump for author lists:

## until 2020

Andreas Abel, Jonas Almström Duregård, Krasimir Angelov, Jean-Philippe Bernardy, Björn Bringert, Johan Broberg, Kyle Butt, Paul Callaghan, Grégoire Détrez, Markus Forsberg, Ola Frid, Peter Gammie, Thomas Hallgren, Pascal Hof, Simon Huber, Patrik Jansson, Kristofer Johannisson, Antti-Juhani Kaijanaho, Andreas Lööw, Justin Meiners, Kent Mein, Ulf Norell, Gabriele Paganelli, Michael Pellauer, Fabian Ruch, and Aarne Ranta 2002 - 2020.

## until 2013

Jonas Almström Duregård, Krasimir Angelov, Jean-Philippe Bernardy, Björn Bringert, Johan Broberg, Paul Callaghan,
Grégoire Détrez, Markus Forsberg, Ola Frid, Peter Gammie, Thomas Hallgren, Patrik Jansson,
Kristofer Johannisson, Antti-Juhani Kaijanaho, Ulf Norell,
Michael Pellauer and Aarne Ranta 2002 - 2013.
