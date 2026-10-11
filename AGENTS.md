# Project Architecture

Use clean architecture organized by feature.

Each feature should contain:

- `data/` for data sources, models, and repository implementations.
- `domain/` for entities, repository contracts, and use cases.
- `presentations/ui/` for screens and widgets.
- `presentations/logic/` for Cubits and their states.
