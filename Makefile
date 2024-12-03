year := 2024

new:
	mkdir -p $(year)/$(day)
	touch $(year)/$(day)/main.cr

run:
	crystal run $(year)/$(day)/main.cr