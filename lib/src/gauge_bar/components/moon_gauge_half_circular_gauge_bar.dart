

part of gauge_bar_library;



class _MoonGaugeHalfCircularGaugeBar extends LeafRenderObjectWidget {

  final double score;
  final Duration animationDuration;
  late MoonGaugeBarStyleUIModel gaugeStyle;
  final MoonGaugeScoreStyleUIModel scoreStyle;
  final MoonGaugeLabelStyleUIModel labelStyle;

  _MoonGaugeHalfCircularGaugeBar({
    required this.score,
    this.animationDuration = const Duration(milliseconds: 500),
    MoonGaugeBarStyleUIModel? gaugeStyle,
    this.scoreStyle = const MoonGaugeScoreStyleUIModel(),
    this.labelStyle = const MoonGaugeLabelStyleUIModel()
  }) {
    this.gaugeStyle = gaugeStyle ?? MoonGaugeBarStyleUIModel();
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _MoonGaugeHalfCircularGaugeBarRenderBox(
      score: score,
      animationDuration: animationDuration,
      gaugeStyle: gaugeStyle,
      scoreStyle: scoreStyle,
      labelStyle: labelStyle
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant _MoonGaugeHalfCircularGaugeBarRenderBox renderObject) {
    bool isChanged = false;

    if(renderObject.score != score) {
      isChanged = true;
      renderObject.score = score;
    }
    if(renderObject.animationDuration.inMilliseconds != animationDuration.inMilliseconds) {
      isChanged = true;
      renderObject.animationDuration = animationDuration;
    }
    if(renderObject.gaugeStyle != gaugeStyle) {
      isChanged = true;
      renderObject.gaugeStyle = gaugeStyle;
    }
    if(renderObject.scoreStyle != scoreStyle) {
      isChanged = true;
      renderObject.scoreStyle = scoreStyle;
    }
    if(renderObject.labelStyle != labelStyle) {
      isChanged = true;
      renderObject.labelStyle = labelStyle;
    }


    if(isChanged) {
      renderObject.startAnimation();
    }
  }

  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
    if(runtimeType != other.runtimeType) return false;
    return other is _MoonGaugeHalfCircularGaugeBar &&
      other.score == score &&
      other.animationDuration.inMilliseconds == animationDuration.inMilliseconds &&
      other.gaugeStyle == gaugeStyle;
  }

  @override
  int get hashCode => Object.hash(score, animationDuration.inMilliseconds, gaugeStyle);
}


class _MoonGaugeHalfCircularGaugeBarRenderBox extends RenderBox {

  late TextPainter _textPainter;
  late Ticker _ticker;

  double score;
  Duration animationDuration;
  MoonGaugeBarStyleUIModel gaugeStyle;
  MoonGaugeScoreStyleUIModel scoreStyle;
  MoonGaugeLabelStyleUIModel labelStyle;
  

  double _oldScore = 0;
  double _progress = 0;

  _MoonGaugeHalfCircularGaugeBarRenderBox({
    required this.score,
    required this.animationDuration,
    required this.gaugeStyle,
    required this.scoreStyle,
    required this.labelStyle
  }) {
    _textPainter = TextPainter(textDirection: TextDirection.ltr,);
    _ticker = Ticker(_tick);
  }

  void _tick(Duration elapsed) {
    if(elapsed.inMilliseconds >= animationDuration.inMilliseconds) {
      _progress = 1;
      _ticker.stop();
      _oldScore = score;
    } else {
      _progress = math.pow(elapsed.inMilliseconds, 2) / math.pow(animationDuration.inMilliseconds, 2);
    }
    markNeedsPaint();
  }

  void startAnimation() {
    if(_ticker.isTicking) { return; }
    _ticker.start();
  }

  @override
  void detach() {
    _ticker.dispose();
    super.detach();
  }

  @override
  void performLayout() {
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    var canvas = context.canvas;

    var fittedWidthArcStrokeWidth = (size.width / 317) * 25;
    var fittedHeightArcStrokeWidth = (size.height / 167) * 25;

    var arcStrokeWidth = fittedWidthArcStrokeWidth > fittedHeightArcStrokeWidth ? fittedHeightArcStrokeWidth : fittedWidthArcStrokeWidth;

    var backgroundArcPaint = Paint()
      ..style = PaintingStyle.stroke
      ..shader = gaugeStyle.backgroundGradient
      ..strokeCap = gaugeStyle.gaugeBarCap
      ..strokeWidth = arcStrokeWidth * gaugeStyle.gaugeBarWidthScale;
    var frontArcPaint = Paint()
      ..style = PaintingStyle.stroke
      ..shader = gaugeStyle.gaugeGradient
      ..strokeCap = gaugeStyle.gaugeBarCap
      ..strokeWidth = arcStrokeWidth * gaugeStyle.gaugeBarWidthScale;

    final Rect rect = Rect.fromCircle(center: Offset(offset.dx + size.width / 2, offset.dy + size.height * 0.8), radius: size.height * 0.6);

    if(score.isNaN) {
      score = 0;
    }

    double animatedScore = _oldScore + (score - _oldScore) * _progress;
    double animatedSweepAngle = (animatedScore / 100) * math.pi;

    canvas.drawArc(rect, 0, -math.pi, false, backgroundArcPaint);
    canvas.drawArc(rect, -math.pi, animatedSweepAngle, false, frontArcPaint);

    _paintScoreTitleText(canvas, offset);
    _paintScoreText(canvas, offset, animatedScore);
    _paintMinMaxLabel(canvas, offset, rect);
  }

  void _paintScoreTitleText(Canvas canvas, Offset offset) {

    var fittedWidthTitleFotSize = (size.width / 317) * 18;
    var fittedHeightTitleFotSize = (size.height / 167) * 18;

    var titleFontSize = fittedWidthTitleFotSize > fittedHeightTitleFotSize ? fittedHeightTitleFotSize : fittedWidthTitleFotSize;
    _textPainter.text = TextSpan(
        text: scoreStyle.title,
        style: scoreStyle.getTitleStyle(titleFontSize)
    );
    _textPainter.layout(minWidth: 0, maxWidth: constraints.maxWidth);
    _textPainter.paint(canvas, Offset(offset.dx + size.width / 2 - _textPainter.width / 2, offset.dy + size.height / 2 - _textPainter.height));
  }

  void _paintScoreText(Canvas canvas, Offset offset, double score) {

    var fittedWidthScoreFotSize = (size.width / 317) * 30;
    var fittedHeightScoreFotSize = (size.height / 167) * 30;

    var scoreFontSize = fittedWidthScoreFotSize > fittedHeightScoreFotSize ? fittedHeightScoreFotSize : fittedWidthScoreFotSize;
    _textPainter.text = TextSpan(
        text: score.toStringAsFixed(2),
        style: scoreStyle.getScoreStyle(scoreFontSize)
    );
    _textPainter.layout(minWidth: 0, maxWidth: constraints.maxWidth);
    _textPainter.paint(canvas, Offset(offset.dx + size.width / 2 - _textPainter.width / 2, offset.dy + size.height / 2 + _textPainter.height / 4));
  }

  void _paintMinMaxLabel(Canvas canvas, Offset offset, Rect rect) {

    var fittedWidthLabelFotSize = (size.width / 317) * 10;
    var fittedHeightLabelFotSize = (size.height / 167) * 10;

    var labelFontSize = fittedWidthLabelFotSize > fittedHeightLabelFotSize ? fittedHeightLabelFotSize : fittedWidthLabelFotSize;

    _textPainter.text = TextSpan(text: labelStyle.startPointText, style: labelStyle.getStartPointStyle(labelFontSize));
    _textPainter.layout(minWidth: 0, maxWidth: constraints.maxWidth);
    _textPainter.paint(canvas, Offset(rect.left - _textPainter.width / 2, rect.bottom - rect.height / 2 + _textPainter.height));

    _textPainter.text = TextSpan(text: labelStyle.endPointText, style: labelStyle.getEndPointStyle(labelFontSize));
    _textPainter.layout(minWidth: 0, maxWidth: constraints.maxWidth);
    _textPainter.paint(canvas, Offset(rect.right - _textPainter.width / 2, rect.bottom - rect.height / 2 + _textPainter.height));
  }

  @override
  bool get isRepaintBoundary => true;
}