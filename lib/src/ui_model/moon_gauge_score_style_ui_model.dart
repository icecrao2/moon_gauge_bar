

part of ui_model;



class MoonGaugeScoreStyleUIModel {

  final String title;
  final TextStyle _titleStyle;
  final double titleTextScale;
  final TextStyle _scoreStyle;
  final double scoreTextScale;

  const MoonGaugeScoreStyleUIModel({
    this.title = "score",
    this.titleTextScale = 1,
    TextStyle titleStyle = const TextStyle(color: Colors.black38),
    this.scoreTextScale = 1,
    TextStyle scoreStyle = const TextStyle(color: Colors.black),
  })
    : _titleStyle = titleStyle,
      _scoreStyle = scoreStyle;

  TextStyle getTitleStyle(double standardFontSize) => _titleStyle.copyWith(fontSize: standardFontSize * titleTextScale);
  TextStyle getScoreStyle(double standardFontSize) => _scoreStyle.copyWith(fontSize: standardFontSize * scoreTextScale);

  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
    if(runtimeType != other.runtimeType) return false;
    return other is MoonGaugeScoreStyleUIModel &&
      other.title == title &&
      other._titleStyle == _titleStyle &&
      other.titleTextScale == titleTextScale &&
      other._scoreStyle == _scoreStyle &&
      other.scoreTextScale == other.scoreTextScale;
  }

  @override
  int get hashCode => Object.hash(title, _titleStyle, titleTextScale, _scoreStyle, scoreTextScale);
}
