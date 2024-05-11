# Файл для установки, компиляции и т.д. скрипта

install:
	pip install ptaster colorama tqdm --break-system-packages;
install-dev:
	@python -m venv .; \
	source bin/activate; \
	pip install -r requirements.txt --break-system-packages;
uninstall:
	pip uninstall ptaster -y --break-system-packages;
update:
	make uninstall && make install
update-dev:
	make uninstall && make install-dev
build:
	make install-dev; \

	@python setup.py sdist; \
	make clean -C docs/ && make markdown -C docs/ && make html -C docs/
