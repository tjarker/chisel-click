SIM ?= icarus
TOPLEVEL_LANG ?= verilog
COCOTB_HDL_TIMEPRECISION=1ns

.PHONY: all
all: test

.PHONY: clean
clean:
	-@find . -name "obj" | xargs rm -rf
	-@find . -name "*.pyc" | xargs rm -rf
	-@find . -name "*results.xml" | xargs rm -rf
	$(MAKE) -C src/test/python clean

.PHONY: test
test:
	$(MAKE) -k -C src/test/python

.PHONY: single
single:
	$(MAKE) -k -C src/test/python/tests/$(TESTNAME)