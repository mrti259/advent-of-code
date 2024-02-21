new:
	mkdir -p $(day)
	cd $(day)
	touch $(day)/main.cr

run:
	crystal run $(day)/main.cr