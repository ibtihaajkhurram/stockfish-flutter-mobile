# Stockfish Flutter Mobile

A Flutter plugin wrapper for the [Stockfish](https://stockfishchess.org/) chess engine.

This repository is a fork of [ArjanAswal/stockfish](https://github.com/ArjanAswal/stockfish.git), modified for use in mobile applications.

## License & Attribution

This project is licensed under the **GNU General Public License v3.0 (GPL v3)**.

- **Original Author**: Arjan Aswal
- **Original Repository**: [https://github.com/ArjanAswal/stockfish.git](https://github.com/ArjanAswal/stockfish.git)
- **Stockfish Engine**: The underlying Stockfish engine is also licensed under GPL v3.

### Legal Compliance

To maintain "Arm's Length" separation in proprietary applications, the engine must be used via the **UCI (Universal Chess Interface) protocol**. Communication with the engine occurs over standard input/output streams, ensuring that the calling application remains separate from the GPL-licensed engine logic.

## Usage

### Add Dependency

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  stockfish:
    git:
      url: https://github.com/ibtihaajkhurram/stockfish-flutter-mobile
```

### Initialize Engine

```dart
import 'package:stockfish/stockfish.dart';

// Create a new instance
final stockfish = Stockfish();

// State is a ValueListenable<StockfishState>
print(stockfish.state.value); // StockfishState.starting

// The engine takes a few moments to start
// You can listen to the state or await a ready signal
```

### UCI Commands

Commands are sent via `stdin` and results are received via `stdout`.

```dart
// Send commands
stockfish.stdin = 'isready';
stockfish.stdin = 'go movetime 3000';

// Listen for output
stockfish.stdout.listen((line) {
  print('Stockfish said: $line');
});
```

### Disposal

Always dispose of the engine when it's no longer needed to free up resources and isolates.

```dart
stockfish.dispose();
```

## Platform Requirements

- **iOS**: `IPHONEOS_DEPLOYMENT_TARGET` must be >= 11.0.
- **Android**: Compatible with standard Flutter Android builds.

---

_Note: Only one instance of the engine can be created at a time._

