all: build push

build.elm.base:
	  docker build -t matteosister/elm-build-deps elm-build-deps

build.elm:
	  docker build -t matteosister/elm:0.15.1 elm/0.15.1
		docker build -t matteosister/elm:latest elm/0.15.1

build: build.elm.base build.elm

push.elm.base:
		docker push matteosister/elm-build-deps

push.elm:
		docker push matteosister/elm

push: push.elm.base push.elm
