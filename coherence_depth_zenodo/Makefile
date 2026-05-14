.PHONY: artifact-check agda theorem-map audit-postulates case-studies paper clean-paper

PYTHON ?= python
AGDA ?= agda

artifact-check: agda theorem-map audit-postulates case-studies

agda:
	cd agda && $(AGDA) --transliterate Everything.agda
	cd agda && $(AGDA) --transliterate Geometry/Clutching.agda
	cd agda && $(AGDA) --transliterate Test/ClutchingSmoke.agda

theorem-map:
	$(PYTHON) scripts/check_paper_map.py paper-map.yaml

audit-postulates:
	$(PYTHON) scripts/audit_postulates.py agda paper-map.yaml

case-studies:
	$(PYTHON) scripts/coherence_depth_audit.py runs/coherence_depth_case_studies

paper:
	cd paper && pdflatex -interaction=nonstopmode -halt-on-error 1_coherence_depth.tex
	cd paper && bibtex 1_coherence_depth
	cd paper && pdflatex -interaction=nonstopmode -halt-on-error 1_coherence_depth.tex
	cd paper && pdflatex -interaction=nonstopmode -halt-on-error 1_coherence_depth.tex

clean-paper:
	cd paper && rm -f 1_coherence_depth.aux 1_coherence_depth.bbl 1_coherence_depth.blg \
	  1_coherence_depth.log 1_coherence_depth.out 1_coherence_depth.toc
