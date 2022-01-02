NMCUT=nodemcu-tool
PORT=/dev/ttyUSB0

ENV_FILE=./.env
SRC_DIR=./src
ETR_FILE=init.lua

FILES=$(ENV_FILE) \
			$(SRC_DIR)/$(ETR_FILE) \
			$(SRC_DIR)/utils/Env.lua \
			$(SRC_DIR)/utils/Str.lua

list_devices:
	$(NMCUT) devices

reset:
	$(NMCUT) reset

format:
	$(NMCUT) mkfs --port=$(PORT)

upload:
	$(NMCUT) upload --port=$(PORT) $(FILES)

run:
	$(NMCUT) run $(ETR_FILE)

fun:
	make upload
	make run
