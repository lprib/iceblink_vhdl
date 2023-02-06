PIN_DEF = iceblink.pcf
DEVICE = lp1k
PACKAGE = qn84

leds.json: blink.vhdl leds.vhdl
	yosys -m ghdl -p 'ghdl $^ -e leds; synth_ice40 -json $@'

%.asc: %.json $(PIN_DEF)
	nextpnr-ice40 --$(DEVICE) --json $< --pcf $(PIN_DEF) --asc $@ --package $(PACKAGE)

%.bin: %.asc
	icepack $< $@

prog: leds.bin
	iCEburn  -e -v -w  $<