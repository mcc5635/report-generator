.PHONY: reports-styled reports-default report-docx slides deploy clean

all: reports-default reports-styled reports-docx slides

slides: slides/index.html

styling/index.html: styling/slides.Rmd
Rscript -e 'xfun::in_dir("styling", rmarkdown::render("$(<F)", output_file = "$(@F)", quiet = TRUE))'

# targets for demo files
DEMORMD = styling-bootstrap.Rmd

reports-styled: styling/styling-bootstrap-styled.html

reports-default: styling/styling-bootstrap-default.html

reports-docx: slides/june-report.docx

slides/styling-bootstrap-styled.html: $(DEMORMD)
Rscript -e 'rmarkdown::render("$<", output_file = "$(@F)", quiet = TRUE)'
mv $(@F) $@
  cp $< $(@D)

slides/styling-bootstrap-default.html: $(DEMORMD)
Rscript -e 'rmarkdown::render("$<", output_file = "$(@F)", rmarkdown::html_document(theme = list(version = 4)), quiet = TRUE)'
mv $(@F) $@
  cp $< $(@D)

DEMODOCX = june-report.Rmd

slides/pinguins-report.docx: june-report.Rmd template.docx
Rscript -e 'rmarkdown::render("$<", output_file = "$(@F)", quiet = TRUE)'
mv $(@F) $@
  cp -t $(@D) $^
  
  # deployement
  ## this require the netlify cli to be setup
  deploy:
  cd slides && \
netlify deploy --dir=. --prod || echo '## >> netlify not configured - deployement skipped'

clean:
  rm slides/styling-bootstrap-styled.html
  rm styling/styling-bootstrap-default.html
  rm styling/styling-bootstrap.Rmd
  rm climate-reports/june-report.docx
  rm climate-reports/template.docx
  rm climate-reports/june-report.Rmd


