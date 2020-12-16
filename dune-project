(lang dune 2.8)
(name test-mdx-new-stanza)

(generate_opam_files true)

(source (github NathanReb/test-mdx-new-stanza))

(package
  (name test-mdx-new-stanza)
  (depends mdx))

(using mdx 0.2)
