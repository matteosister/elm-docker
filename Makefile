all: build push

build:
	  docker build -t matteosister/elm:0.15.1 elm/0.15.1
		docker build -t matteosister/elm:latest elm/0.15.1

push:
		docker push matteosister/elm
