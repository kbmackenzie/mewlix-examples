all: build

build:
	mewlix build

run:
	mewlix run

clean:
	mewlix clean

test: clean
	mewlix run -rc './test/mewlix.test.yaml'
	mewlix clean

.PHONY: build run clean test
