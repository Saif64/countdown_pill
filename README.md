# countdown_pill

A customizable countdown timer widget for Flutter, with real-time updates, flexible styling options, and optional animations.


## Features
- Real-time countdown updates every second.
- Highly customizable text style and decoration (padding, color, border radius, etc.).
- Optional scale animation effect for a dynamic, engaging UI.
- Supports dynamic size and flexible layout with various formatting options.
- Simple API design with minimal setup.
- Lightweight and easy to integrate into any Flutter project.

## Installation
#### Add the following to your pubspec.yaml:
```dependencies:
  countdown_pill: ^1.0.0
  ```

<img src="https://github.com/Saif64/countdown_pill/blob/master/ss/Screenshot%202025-03-03%20at%2012.31.42.png?raw=true" />
<img src="https://github.com/Saif64/countdown_pill/blob/master/ss/Screenshot%202025-03-03%20at%2012.32.52.png?raw=true" />

## Basic Example
```dart
CountdownPill(
    targetDate: DateTime(2025, 3, 25),
    format: '{d} days {H} hours {M} minutes {S} seconds',
)
```
<img src="https://github.com/Saif64/countdown_pill/blob/master/ss/Screenshot%202025-03-03%20at%2012.32.24.png?raw=true" />
<img src="https://github.com/Saif64/countdown_pill/blob/master/ss/Screenshot%202025-03-03%20at%2012.32.46.png?raw=true" />

## Custom Styling Example
```dart
CountdownPill(
      targetDate: DateTime(2025, 3, 25),
      format: '{d} days {H} hours {M} minutes {S} seconds',
      animate: false,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 2),
      ),
      textStyle: TextStyle(fontSize: 16, color: Colors.white),
)
```
## For animation
```
animate: true
```
