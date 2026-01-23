# Plans

This folder contains the PRD (Product Requirements Document) that Ralph uses to guide the AI agent.

## Files

File              | Purpose
----------------- | ------------------------------
`prd.json`        | Default PRD -- your work items
`prd-<name>.json` | Optional per-prompt PRDs

## `prd.json` Format

A JSON array of work items:

```json
"userStories": [
    {
      "id": "SKILL-001",
      "title": "Develop agentic python skill",
      "description": "As a developer, I need to create a skill for agentic development via copilot.",
      "acceptanceCriteria": [
        "A new file ./skills/skill-python-development/skill.md is created",
        "The skill describes how the agent used for python development should behave",
        "The skill uses best practices"
      ],
      "passes": false,
      "notes": ""
    }
```

Field                | Description
-------------------- | --------------------------------
`id`                 | identifies the requirement
`title`              | One-line requirement
`description`        | What is required
`acceptanceCriteria` | `false` → `true` when complete
`passes`             | were the acceptanceCriteria met?
`notes`              | further instructions for you

## Best Practices

- **Keep items small** -- one feature per agent iteration
- **Be specific** -- clear acceptance criteria help the agent
- **Start with `passes: false`** -- the agent flips it to `true`
- **Order by priority** -- agent picks from the top

## Per-Prompt PRDs

Use `--prd` to specify a different PRD file:

```bash
./ralph.sh --prd plans/prd-wordpress.json --prompt prompts/wp.txt --allow-profile safe 10
```

## Example Only

The included `prd.json` is a template (chat-app stories). Replace with your own requirements.
