BUILD_NUMBER = 3

all: deps build

deps-go:
	go run build.go setup

deps-js:
	yarn install --pure-lockfile --no-progress

deps: deps-go deps-js

build-go:
	go run build.go build

build-js:
	npm run build

build: build-go build-js

test-go:
	go test -v ./pkg/...

test-js:
	npm test

test: test-go test-js

run:
	./bin/grafana-server

docker-deps-js:
  docker run -v $(CURDIR):/go/src/github.com/grafana/grafana -w /go/src/github.com/grafana/grafana grafana/buildcontainer yarn install --pure-lockfile --no-progress

docker:
  docker run -v $(CURDIR):/go/src/github.com/grafana/grafana -e CIRCLE_BUILD_NUM=$(BUILD_NUMBER) grafana/buildcontainer
  ./docker-image/build.sh
