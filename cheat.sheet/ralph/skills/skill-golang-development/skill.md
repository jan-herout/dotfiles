---
name: skill-golang-development
description: "Use when doing agentic Go development: repo triage, minimal diffs, correctness, tests, and pragmatic debugging."
compatibility: "Works in repos that may or may not use standard Go tooling (go.mod, go test, golangci-lint)."
---

# Agentic Go Development

## When to use

Use this skill when you are asked to implement or modify Go code (libraries, CLIs, services) and need to do it safely and efficiently in an unfamiliar repository.

## Operating principles

- **Smallest-change wins**: prefer minimal diffs that satisfy requirements.
- **Source-of-truth first**: follow repo docs/config (`go.mod`, `go.work`, CI, Makefile) over assumptions.
- **Reproducible runs**: use deterministic commands and record what you ran.
- **Safety**: avoid destructive commands; never print secrets; do not add dependencies unless required.

## Inputs to gather (quick triage)

1. **Repo intent**: what is being built (library/CLI/service) and where entrypoints live (`main` packages).
2. **Go version**: from `go.mod` (`go 1.x`), `.tool-versions`, CI, Dockerfile.
3. **Tooling present**:
   - Modules/workspaces: `go.mod`, `go.sum`, `go.work`
   - Build harness: `Makefile`, `Taskfile.yml`, `magefile.go`, `goreleaser.yaml`
   - Quality: `golangci-lint`, `staticcheck`, `govulncheck`
   - Tests: `go test ./...`, integration tests, race detector

## Procedure

### 0) Establish a baseline

- Locate Go sources and configs:
  - `find . -name '*.go' -maxdepth ...`
  - `ls go.mod go.work Makefile` (if present)
- If tests exist, run them **before** changes to learn baseline behavior.

### 1) Understand the change request

- Identify the *single* target feature/bug.
- Locate the code path(s): entrypoint → call graph → affected package(s).
- Determine acceptance criteria and how to verify (tests, CLI output, behavior).

### 2) Implement with guardrails

- Prefer **small, testable functions** and explicit interfaces.
- Keep side effects isolated (I/O, network) behind interfaces for unit testing.
- Respect package boundaries; avoid cross-package cycles.
- Avoid premature concurrency; add it only if required.

### 3) Correctness patterns (Go-specific)

- Handle errors explicitly; wrap with context: `fmt.Errorf("...: %w", err)`.
- Don’t ignore returned errors (including from `Close()`, `Flush()`).
- Prefer context propagation for I/O and requests (`context.Context`).
- Keep `defer` costs in mind in hot loops; otherwise use it for clarity.

### 4) Security and data safety (default)

- Never log secrets (tokens, passwords, private keys).
- Avoid `exec.Command("sh", "-c", ...)` with untrusted input; prefer argument lists.
- Validate inputs at boundaries; avoid path traversal when handling file paths.
- Consider `govulncheck` when changing dependencies or handling untrusted data.

### 5) Run the repo’s checks

Prefer existing scripts/config:

- Module sanity:
  - `go mod tidy` (only if you changed deps)
  - `go mod verify`
- Tests:
  - `go test ./...`
  - `go test -race ./...` (when concurrency is involved)
- Lint/security (only if present):
  - `golangci-lint run`
  - `govulncheck ./...`

### 6) Leave the repo better

- Update docs/config only when required by the change.
- Record commands run and outcomes in the task log (e.g., progress file) if the workflow asks for it.

## Deliverable checklist

- [ ] Change implemented with minimal diff
- [ ] Tests added/updated as appropriate
- [ ] Tests/checks run (or clearly noted why not)
- [ ] No secrets logged; no destructive operations
