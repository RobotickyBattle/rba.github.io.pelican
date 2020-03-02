PIP_COMPILE_FLAGS = -U --generate-hashes --build-isolation
PYTHON_SOURCES = web

default: check

check: black-check flake8 mypy

fmt: black

black:
	black $(PYTHON_SOURCES)

black-check:
	black --check --diff $(PYTHON_SOURCES)

flake8:
	flake8 $(PYTHON_SOURCES)

mypy:
	mypy $(PYTHON_SOURCES)


requirements:
	@echo "# Please seat back and relax, this may take some time. :)"
	pip-compile $(PIP_COMPILE_FLAGS) -o requirements-dev.txt requirements-dev.in
	pip-compile $(PIP_COMPILE_FLAGS) -o requirements.txt requirements.in

.PHONY: default fmt check black black-check flake8 mypy requirements
