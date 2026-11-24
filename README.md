# Robot Framework API Automation

API test suite with Robot Framework against the public [JSONPlaceholder](https://jsonplaceholder.typicode.com) API.

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

## Notes

- Suites use RequestsLibrary sessions and JSONLibrary path assertions.
- Layout is Pabot-ready for parallel runs.
- CI installs deps and runs `features/` on every push to `main`.

## License

MIT
