# LMCS Length Justification Fallback

Until a local TeX/PDF toolchain is available, use the following editor-facing note if the
compiled manuscript remains above the usual LMCS length target:

> The manuscript is longer than a compact announcement because the central result depends on
> explicit definitions of the fixed sealed-extension calculus, the dependent objects
> `Real_k(X)`, the structural horn grammar, the horn-to-open-box adequacy theorem, the
> total-extension contractibility distinction, and the replacement theorem used to eliminate
> higher structural trace from minimal public signatures.  The recurrence material has been
> reduced to a conditional accounting consequence, while the expanded proof detail remains in
> the main text so that the theorem stack and artifact status are auditable by referees.

Replace this fallback with an actual page-count decision once `pdflatex` and `pdfinfo` are
available.
