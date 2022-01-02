NMCUT=nodemcu-tool
PORT=/dev/ttyUSB0

SRC_DIR=./src
ETR_FILE=init.lua

list_devices:
	$(NMCUT) devices

reset:
	$(NMCUT) reset

format:
	$(NMCUT) mkfs --port=$(PORT)

upload:
	$(NMCUT) upload --port=$(PORT) $(SRC_DIR)$(ETR_FILE)

run:
	$(NMCUT) run $(ETR_FILE)
