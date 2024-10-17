## Features
A simple and easy-to-use gauge bar package!

### 1. half circular gauge bar
![half_circular_gaugebar.gif](half_circular_gaugebar.gif)


## Getting started

```flutter pub add moon_gauge_bar```

## Usage

### 1. half circular gauge bar
```dart
SizedBox(
    width: 200,
    height: 200,
    // use moon gauge bar
    child: MoonGaugeBar.halfCircularGaugeBar(
        score: score,
        labelStyle: const MoonGaugeLabelStyleUIModel(
            startPointText: "0",
            endPointText: "100",
        ),
    ),
)
```

## Additional information

### properties objects
1. gaugeStyle : MoonGaugeBarStyleUIModel()
Define the style for the gauge bar.
2. labelStyle : MoonGaugeLabelStyleUIModel()
Define the style for the gauge bar labels.
3. scoreStyle : MoonGaugeScoreStyleUIModel()
Define the style for the score in the center of the gauge bar.
