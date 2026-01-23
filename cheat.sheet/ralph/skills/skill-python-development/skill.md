---
name: skill-python-development
description: "Use when doing agentic Python development: repo triage, planning, safe edits, testing, and pragmatic debugging."
compatibility: "Works in repos that may or may not use Python tooling (pip/poetry/uv/pytest/mypy/ruff)."
---

# Agentic Python Development

## When to use

Use this skill when you are asked to implement or modify Python code (scripts, libraries, CLIs, services) and need to do it safely and efficiently in an unfamiliar repository.

## Operating principles

- **Smallest-change wins**: prefer minimal diffs that satisfy requirements.
- **Source-of-truth first**: follow repo docs/config (README, pyproject.toml, requirements files) over assumptions.
- **Reproducible runs**: use deterministic commands and record what you ran.
- **Safety**: avoid destructive commands; never print secrets; do not add dependencies unless required.
- **Python version**: prefer Python 3.13 whenever possible
- **Isolation**: 
  - always assume that we will use a virtual environment for any tests
  - if it does not exist, use `uv venv` to create one, and then install these tools into it using `uv pip instal black flake8`
- **Directory structure**
  - source code goes into `./src`
  - tests go into `./test`
- **Testing**
  - prefer use of pytest
  - prefer simple functions over unit test classes

## Inputs to gather (quick triage)

1. **Repo intent**: what is being built (library/CLI/service) and where entrypoints live.
2. **Python version**: from `pyproject.toml`, `.python-version`, `runtime.txt`, CI, or Dockerfile.
3. **Tooling present**:
   - Packaging: `pyproject.toml` (PEP 621), `setup.cfg`, `setup.py`
   - Env mgmt: `uv`, `poetry`, `pip-tools`, `venv`
   - Quality: `ruff`, `black`, `isort`, `flake8`, `mypy`, `pyright`
   - Tests: `pytest`, `unittest`, `nose`, `tox`, `nox`

## Procedure

### 0) Establish a baseline

- Find Python files and key configs:
  - `ls` / `find . -maxdepth ... -name '*.py'`
  - `ls pyproject.toml setup.cfg setup.py requirements*.txt`
- If tests exist, run them **before** changes to learn the baseline behavior.

### 1) Understand the change request

- Identify the *single* target feature/bug.
- Locate the code path(s): entrypoint → call graph → affected module(s).
- Determine acceptance criteria and how to verify (tests, CLI output, behavior).

### 2) Implement with guardrails

- Prefer **pure functions** and explicit interfaces.
- Keep side effects isolated (I/O, network, filesystem) and mockable.
- Add/adjust tests close to the changed behavior.
- Maintain backward compatibility unless explicitly allowed to break it.
- Always use `uv run black <file.py>` on any file you change

### 3) Error handling and correctness

- Fail fast with clear exceptions for programmer errors.
- For user/input errors, raise/return actionable messages.
- Validate inputs at boundaries; keep internal invariants strong.

### 4) Security and data safety (default)

- Never log secrets (tokens, passwords, private keys).
- Use safe path handling (avoid path traversal; prefer `pathlib.Path.resolve()` checks when needed).
- Avoid `eval`/`exec` and shelling out with untrusted input.
- When spawning processes, use `subprocess.run([...], check=True)` (list args) rather than string commands.

### 5) Run the repo’s checks

Prefer existing scripts/config:

- If `pyproject.toml` defines tools, run those.
- Typical commands (only if present in repo):
  - `pytest -q`
  - `python -m unittest`
  - `ruff check .`
  - `mypy .`

### 6) Leave the repo better

- Update docs/config only when required by the change.
- Record commands run and outcomes in the task log (e.g., progress file) if the workflow asks for it.

## Deliverable checklist

- [ ] Change implemented with minimal diff
- [ ] Tests added/updated as appropriate
- [ ] Tests/checks run (or clearly noted why not)
- [ ] No secrets logged; no destructive operations
