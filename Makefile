doc:
	pandoc src/index.md src/links.md -f markdown+task_lists -o docs/index.html --standalone --template=./src/templates/template.html
	pandoc src/implementation-and-guidance.md src/links.md -f markdown+task_lists -o docs/implementation-and-guidance.html --standalone  --template=./src/templates/template.html