CHIP = 16F887
OUT = build
XC8_ARGS = -mcpu=$(CHIP) -DCOMPILATION -O2
IPECMD = /opt/microchip/mplabx/v5.50/mplab_platform/mplab_ipe/ipecmd.jar
TOOL = PPK3

$(shell   mkdir -p $(OUT))

all: $(OUT)/main.hex

$(OUT)/main.hex: main.c
	xc8-cc $(XC8_ARGS) main.c -o $(OUT)/main.hex

clean:
	rm -dr build

program:
	java -jar $(IPECMD) -P$(CHIP) -T$(TOOL) -F$(OUT)/main.hex -M