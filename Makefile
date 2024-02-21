new:
	mkdir -p $(day)
	touch $(day)/main.cr

run:
	crystal run $(day)/main.cr