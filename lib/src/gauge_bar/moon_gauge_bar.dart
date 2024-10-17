

part of gauge_bar_library;



class MoonGaugeBar extends StatelessWidget {

  final double score;
  final Duration animationDuration;
  late MoonGaugeBarStyleUIModel gaugeStyle;
  final MoonGaugeScoreStyleUIModel scoreStyle;
  final MoonGaugeLabelStyleUIModel labelStyle;
  final MoonGaugeStyleUIModel _style;

  MoonGaugeBar.halfCircularGaugeBar({
    super.key,
    required this.score,
    this.animationDuration = const Duration(milliseconds: 500),
    MoonGaugeBarStyleUIModel? gaugeStyle,
    this.scoreStyle = const MoonGaugeScoreStyleUIModel(),
    this.labelStyle = const MoonGaugeLabelStyleUIModel()
  })
    : _style = MoonGaugeStyleUIModel.halfCircular {
    this.gaugeStyle = gaugeStyle ?? MoonGaugeBarStyleUIModel();
  }

  @override
  Widget build(BuildContext context) {
    switch(_style){
      case MoonGaugeStyleUIModel.halfCircular:
        return _MoonGaugeHalfCircularGaugeBar(score: score, animationDuration: animationDuration, gaugeStyle: gaugeStyle, scoreStyle: scoreStyle, labelStyle: labelStyle);
    }
  }
}