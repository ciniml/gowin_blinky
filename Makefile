.PHONY: all clean synthesis run deploy

BITSTREAM := impl/pnr/blinky.fs
SRCS := $(wildcard serv/rtl/*.v) $(wildcard serv/rtl/*.sv) $(wildcard src/*.sv) $(wildcard rtl/*.cst) $(wildcard rtl/*.sdc) synthesize.cfg
DEVICE ?= GW1N-4

all: synthesis

$(BITSTREAM): $(SRCS)
	gw_sh ./project.tcl

synthesis: $(BITSTREAM)

run: $(BITSTREAM)
	if lsmod | grep ftdi_sio; then sudo modprobe -r ftdi_sio; fi
	programmer_cli --device $(DEVICE) --run 2 --fsFile $(abspath $(BITSTREAM))

deploy: $(BITSTREAM)
	if lsmod | grep ftdi_sio; then sudo modprobe -r ftdi_sio; fi
	programmer_cli --device $(DEVICE) --run 6 --fsFile $(abspath $(BITSTREAM))

clean:
	-@$(RM) -rf impl
