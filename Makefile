.PHONY: all build run clean

# NAME has been assigned
# the generic name "libra"

NAME=libra

all: build

default: build

build:
	make clean
	@dune build bin/main.exe
	@cp ./_build/default/bin/main.exe $(NAME)

run:
	make all
	dune exec -- ./libra
# Sorry I'm not good with Make.
# Change "libra" to whatever you want.

clean:
	@dune clean
	@rm -f $(NAME)
