clean:
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
	rm -rf .cache
	rm -rf build
	rm -rf dist
	rm -rf *.egg-info
	rm -rf htmlcov
	rm -rf .tox/
	rm -rf docs/_build
	pip install -e .[dev] --upgrade --no-cache

install:
	pip install --upgrade pip
	pip install -e .['dev']
	pip freeze

init_db:
	FLASK_APP=moscoder/app.py FLASK_ENV=development flask create-db
	# FLASK_APP=moscoder/app.py FLASK_ENV=development flask db upgrade

test:
	FLASK_ENV=test pytest tests/ -v --cov=moscoder

format:
	isort **/*.py
	black -l 79 **/*.py

run:
	FLASK_APP=moscoder/app.py FLASK_ENV=development flask run

setup:
	python setup.py install
