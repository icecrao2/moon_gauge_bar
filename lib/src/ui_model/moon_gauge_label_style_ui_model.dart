

part of ui_model;



class MoonGaugeLabelStyleUIModel {
  final String startPointText;
  final String endPointText;
  final TextStyle _startPointLabelTextStyle;
  final TextStyle _endPointLabelTextStyle;
  final double startPointTextScale;
  final double endPointTextScale;

  const MoonGaugeLabelStyleUIModel({
    this.startPointText = "0",
    this.endPointText = "100",
    TextStyle startPointLabelStyle = const TextStyle(),
    TextStyle endPointLabelStyle = const TextStyle(),
    this.startPointTextScale = 1,
    this.endPointTextScale = 1
  })
    : _startPointLabelTextStyle = startPointLabelStyle,
      _endPointLabelTextStyle = endPointLabelStyle;

  TextStyle getStartPointStyle(double standardFontSize) => _startPointLabelTextStyle.copyWith(fontSize: standardFontSize * startPointTextScale);
  TextStyle getEndPointStyle(double standardFontSize) => _endPointLabelTextStyle.copyWith(fontSize: standardFontSize * endPointTextScale);

  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
    if(runtimeType != other.runtimeType) return false;
    return other is MoonGaugeLabelStyleUIModel &&
        other.startPointText == startPointText &&
        other.endPointText == endPointText &&
        other._startPointLabelTextStyle == _startPointLabelTextStyle &&
        other._endPointLabelTextStyle == _endPointLabelTextStyle &&
        other.startPointTextScale == startPointTextScale &&
        other.endPointTextScale == endPointTextScale;
  }

  @override
  int get hashCode => Object.hash(startPointText, endPointText, _startPointLabelTextStyle, _endPointLabelTextStyle, startPointTextScale, endPointTextScale);
}