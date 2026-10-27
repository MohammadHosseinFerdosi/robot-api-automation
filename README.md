# Robot Framework API Automation

Portfolio sample for API testing with Robot Framework against a **public** API ([JSONPlaceholder](https://jsonplaceholder.typicode.com)).

No company endpoints, tokens, or proprietary domain logic are included.

## What this showcases

| Pattern | Why it matters |
| --- | --- |
| `features/` + `resources/` layout | Clear separation of scenarios vs reusable keywords |
| RequestsLibrary sessions | One session per suite, readable HTTP keywords |
| JSONLibrary assertions | Path-based checks on response bodies |
| Pabot-ready structure | Parallel execution without rewriting suites |
| GitHub Actions CI | Runnable green badge for portfolio credibility |

## Setup

```bash
python -m venv .venv
# Windows
.venv\Scripts\activate
# macOS/Linux
source .venv/bin/activate

pip install -r requirements.txt
```

## Run

```bash
# sequential
robot -d results features/

# parallel
pabot --processes 4 -d results features/

# single domain
robot -d results features/posts/
```

Reports land in `results/` (`log.html`, `report.html`, `output.xml`).

## Layout

```
resources/
  variables.py          BASE_URL and shared config
  api_keywords.robot    session + GET/POST + JSON asserts
features/
  posts/                create + read + negative cases
  users/                collection + field checks
.github/workflows/ci.yml
```

## Design notes

- Suites talk only to a public sandbox API — safe to clone and run anywhere.
- Keywords stay thin and reusable; assertions live in the test cases.
- CI installs deps and runs the full `features/` tree on every push to `main`.

## License

MIT
