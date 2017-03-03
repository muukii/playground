.PHONY: swift
swift:
	open ./swift/Playground/main.playground

.PHONY: commit
commit:
	git add . && git commit -m '⚗️'
