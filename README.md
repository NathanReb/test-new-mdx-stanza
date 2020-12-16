# MDX Stanza 0.2

This is a test repo for the 0.2 version of the MDX stanza.

Here is a simple toplevel block:

```ocaml
# 2 + 2;;
```

## unix loading bug

It appears that when vendoring MDX and its dependencies, using `opam-monorepo` for instance,
running `dune runtest` to verify MDX files will fail with the following error:
```
     mdx_gen .mdx/README.md.corrected (exit 2)
(cd _build/default && ./mdx_gen.bc README.md) > _build/default/.mdx/README.md.corrected
Fatal error: exception Fl_package_base.No_such_package("unix", "")
```

This does not happen when installing everything through opam, nor does it if you only vendor mdx
itself.

To reproduce this, you'll need to pin dune and mdx:
```
opam pin dune.2.8.0 git+https://github.com/voodoos/dune.git#mdx-stanza-rework
opam pin mdx git+https://github.com/NathanReb/mdx.git#dune-subst-workaround
```

You can then install everything throuh opam:
```
opam install ./ --deps-only
```

and run `dune runtest` successfully.
You can then vendor mdx by running:
```
opam monorepo pull mdx
```

and again `dune runtest` should work just fine.
Now if you pull all transitive dependencies like this:
```
opam monorepo pull
```

running `dune runtest` will give you the above mentioned error
