download:
	docker pull konovadocker/nordic-sdk-13.0.0-toolchain

build:
	docker build . -t konovadocker/nordic-sdk-13.0.0-toolchain
