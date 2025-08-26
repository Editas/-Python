PY=python


.PHONY: setup fmt lint test run cov


setup:
pip install --upgrade pip poetry
poetry config virtualenvs.create false
poetry install
pre-commit install || true


fmt:
poetry run black .


lint:
poetry run ruff check . && poetry run mypy src


test:
poetry run pytest -q


cov:
poetry run pytest --cov=src --cov-report=xml --cov-report=html


run:
poetry run python scripts/run_local.py
