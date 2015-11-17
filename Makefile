# get the commandline tool from:
# https://github.com/florianschmidt1994/websequencediagrams
# build with `npm install`
# symlink / alias as wsd or supply the path to the `wsd_get` binary
WSD ?= ./wsd_get
WSD_FLAGS ?= -s mscgen

WSD_FILES := $(wildcard wsd/*.wsd)
PNG_FILES := $(WSD_FILES:.wsd=.png)

.PHONY: diagrams clean
diagrams: $(PNG_FILES)

wsd/%.png: wsd/%.wsd
	wsd $(WSD_FLAGS) -o $@ $<

clean:
	-rm $(PNG_FILES)

test:
	@echo .wsd: $(WSD_FILES) | tr ' ' "\n"
	@echo .png: $(PNG_FILES) | tr ' ' "\n"
