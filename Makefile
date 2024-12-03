year := 2024

new:
	cp -r $(year)/template $(year)/$(day)

run:
	crystal run $(year)/$(day)/main.cr