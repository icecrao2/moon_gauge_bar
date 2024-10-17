

part of ui_model;



class MoonGaugeBarStyleUIModel {
  final StrokeCap gaugeBarCap;
  final double gaugeBarWidthScale;
  late ui.Gradient backgroundGradient;
  late ui.Gradient gaugeGradient;

  MoonGaugeBarStyleUIModel({
    this.gaugeBarCap = StrokeCap.round,
    this.gaugeBarWidthScale = 1,
    Color backgroundColor = Colors.grey,
    Color gaugeColor = Colors.blue
  }) {
    backgroundGradient = ui.Gradient.linear(
      const Offset(0, 0),
      const Offset(200, 0),
      [backgroundColor!, backgroundColor!],
    );
    gaugeGradient = ui.Gradient.linear(
      const Offset(0, 0),
      const Offset(200, 0),
      [gaugeColor!, gaugeColor!],
    );
  }


  MoonGaugeBarStyleUIModel.fromGradient({
    this.gaugeBarCap = StrokeCap.round,
    this.gaugeBarWidthScale = 1,
    required this.backgroundGradient,
    required this.gaugeGradient,
  });

  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
    if(runtimeType != other.runtimeType) return false;
    return other is MoonGaugeBarStyleUIModel &&
      other.gaugeBarCap == gaugeBarCap &&
      other.gaugeBarWidthScale == gaugeBarWidthScale &&
      other.backgroundGradient == backgroundGradient &&
      other.gaugeGradient == gaugeGradient;
  }

  @override
  int get hashCode => Object.hash(gaugeBarCap, gaugeBarWidthScale, backgroundGradient, gaugeGradient);
}