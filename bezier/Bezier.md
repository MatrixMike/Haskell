<ol>
<li>ghc --make Bezier.hs
</li><li>cabal install gloss
</li><li>sudo apt-get install cabal-install
</li><li>cabal update
</li>
</ol>

* Missing C library: GL
This problem can usually be solved by installing the system package that
provides this library (you may need the "-dev" version). If the library is
already installed but in a non-standard location then you can use the flags
--extra-include-dirs= and --extra-lib-dirs= to specify where it is.

