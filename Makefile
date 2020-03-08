LUAROCKS ?=
CHECK = luarocks install luacheck
DISCOUNT = luarocks install lua-discount
LDOC = luarocks install ldoc

all: clean global

clean:
	@rm -rf ./docs

local:
	$(CHECK) --local
	$(DISCOUNT) --local && $(LDOC) --local
	@make $(LUAROCKS) run

global:
	$(CHECK)
	$(DISCOUNT) && $(LDOC)
	@make run

run:
	@make test
	@make docs

test:
	$(LUAROCKS)luacheck .

docs:
	$(LUAROCKS)ldoc Lib -c ./config.ld
