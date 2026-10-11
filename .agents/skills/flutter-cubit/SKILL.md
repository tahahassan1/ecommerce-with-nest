---
name: flutter-cubit
description: Scaffold a Cubit with sealed state classes using Dart 3+ native features. ALWAYS use this skill before writing any Cubit or state file — including when building a full feature, implementing a screen, or adding state management. Triggers on "create cubit", "add cubit", "new cubit", or any task that will produce a *_cubit.dart or *_state.dart file.
allowed-tools: Read Write Edit Glob Grep
---

# Scaffold a Cubit + Sealed State (Dart 3+)

Generate a Cubit and its state file for the given feature. **No Freezed. No build_runner.**

## Rules

- Use `sealed class` for state unions with exhaustive pattern matching.
- Use `switch` expressions where applicable.
- Cubit depends ONLY on UseCases from the domain layer — never on repositories, data sources, or Hive/API/storage directly.
- UseCases depend on abstract repository interfaces from `domain/repositories/` — never on concrete `*RepositoryImpl` or `*Repo` (legacy) classes.
- This codebase is mid-migration to a domain/use-case layer. If a feature has not been migrated yet, do NOT fall back to wiring the Cubit directly to its legacy `*Repo` — stop and ask, or scaffold the missing UseCase(s) and repository interface first.
- Place files in `features/{feature_name}/presentation/logic/{name}_cubit/` (this is the convention used by every migrated feature — e.g. `presentation/logic/groups_cubit/groups_cubit.dart`). Do not use a `bloc/` folder; it does not exist in this codebase.
- Use `const` constructors on all state subclasses.

## State File (`{name}_state.dart`)

```dart
sealed class {Name}State {
  const {Name}State();
}

class {Name}Initial extends {Name}State {
  const {Name}Initial();
}

class {Name}Loading extends {Name}State {
  const {Name}Loading();
}

class {Name}Loaded extends {Name}State {
  final {Entity} data;
  const {Name}Loaded(this.data);
}

class {Name}Error extends {Name}State {
  final String message;
  const {Name}Error(this.message);
}
```

## Cubit File (`{name}_cubit.dart`)

```dart
import 'package:flutter_bloc/flutter_bloc.dart';

class {Name}Cubit extends Cubit<{Name}State> {
  final {UseCase} _useCase;
  // If the cubit's event handlers need more than one use case, inject each
  // one separately — never inject a repository as a shortcut.

  {Name}Cubit(this._useCase) : super(const {Name}Initial());

  Future<void> load({params}) async {
    emit(const {Name}Loading());
    try {
      final data = await _useCase({params});
      emit({Name}Loaded(data));
    } catch (e) {
      emit({Name}Error(AppConstants.errMessage));
    }
  }
}
```

## DI Registration

Register the repository implementation (bound to its domain interface), the use case(s), and the cubit in `core/di/` setup:

```dart
getIt.registerFactory<{Repo}>(() => {Repo}Impl());
getIt.registerFactory(() => {UseCase}(getIt()));
getIt.registerFactory(() => {Name}Cubit(getIt()));
```

## After scaffolding, verify

- Cubit imports no repository, data source, or Hive/API/storage class directly — it only imports UseCase types from `domain/usecases/`.
- UseCase(s) depend on the abstract repository interface (`domain/repositories/`), not on a concrete `*RepositoryImpl` or the legacy `*Repo` class.
- State file has no Flutter imports.
- All state subclasses use `const` constructors.
- `sealed class` enables exhaustive `switch` in `BlocBuilder`.