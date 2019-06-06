asciidoctor-build='asciidoctor index.adoc \
	-a outdir=.build \
	-a imagesdir=images \
	-a imagesoutdir=.build/images \
	-a stylesheet=foundation.css \
	-a stylesdir=/stylesheets/ \
	-o .build/index.html \
	-r asciidoctor-diagram'

docker-run:
	@ docker build . -t asciidoctor-jp-aws
	@ docker run --rm -d \
		--name asciidoctor-jp-aws \
		-v $$(pwd):/documents \
		-it asciidoctor-jp-aws \
		/bin/bash

docker-stop:
	@ docker stop asciidoctor-jp-aws

build:
	@ rm -rf .build; mkdir .build; cp -r images .build/images
	@ docker exec \
		-it asciidoctor-jp-aws \
		bash -c ${asciidoctor-build}

build-for-awscodebuild:
	@ eval ${asciidoctor-build}
