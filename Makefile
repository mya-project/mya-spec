INPUT = src/main.md $(shell find . -ipath './src/chapters/*.md' | sort -nk5 -t'/')
INPUT += $(shell [ -f src/ending.md ] && echo -n 'src/ending.md')
OUTPUT_PDF = mya-specification.pdf
OUTPUT_HTML = output

FLAGS = --fail-if-warnings --toc --citeproc --highlight-style breezedark

PDF_FILTERS = $(shell find . -ipath './src/filters/pdf/*.lua' -exec echo --lua-filter {} \;)
HTML_FILTERS = $(shell find . -ipath './src/filters/html/*.lua' -exec echo --lua-filter {} \;)

HTML_FLAGS = -t chunkedhtml --split-level=3
HTML_FLAGS += $(shell [ -f src/template.html ] && echo -n '--template=src/template.html')

IMAGE_TAG=freedevorg/mya-spec


.PHONY: build
build:
	pandoc $(FLAGS) $(EXTRAFLAGS) -o $(OUTPUT) $(INPUT)

.PHONY: pdf
pdf:
	$(MAKE) OUTPUT="$(OUTPUT_PDF)" EXTRAFLAGS="$(PDF_FILTERS)"

.PHONY: html
html:
	mkdir -p output
	rm -rf "output"
	$(MAKE) OUTPUT="$(OUTPUT_HTML)" EXTRAFLAGS="$(HTML_FLAGS) $(HTML_FILTERS)"

.PHONY: docker
docker:
	docker run --rm -it -v $(shell pwd):/app $(IMAGE_TAG) $(ARGS)

.PHONY: docker-build
docker-build:
	docker build -t $(IMAGE_TAG) .

.PHONY: clean
clean:
	rm -f $(OUTPUT_PDF)
	rm -rf $(OUTPUT_HTML)
