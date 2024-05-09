doc:
	pandoc src/index.md -f markdown+task_lists -o docs/index.html
	pandoc src/implementation-and-guidance.md -f markdown+task_lists -o docs/implementation-and-guidance.html