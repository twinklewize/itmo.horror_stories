import 'dart:ui';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/widgets.dart';

import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';

const _kCardHeight = 400.0;
const _kCardWidth = 300.0;

class HandCardsWidget extends StatefulWidget {
  const HandCardsWidget({
    Key? key,
    required this.hintCards,
    required this.onPressed,
    required this.phase,
  }) : super(key: key);
  final List<HintCardModel> hintCards;
  final Function(HintCardModel hintCard) onPressed;
  final GamePhase phase;

  @override
  State<HandCardsWidget> createState() => _HandCardsWidgetState();
}

class _HandCardsWidgetState extends State<HandCardsWidget> {
  int currentPage = 0;
  final pageController = PageController(initialPage: 0);

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    if (widget.hintCards.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: UISize.base8x),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 400, maxWidth: 300),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: PageView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: widget.hintCards.length,
                controller: pageController,
                itemBuilder: (context, index) => SizedBox(
                  width: _kCardWidth,
                  height: _kCardHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(UISize.base4x),
                    child: FlipCard(
                      back: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: theme.colors.system.surface,
                            width: 4.0,
                          ),
                          color: theme.colors.system.surfaceDark,
                        ),
                        width: _kCardWidth,
                        height: _kCardHeight,
                        child: Padding(
                          padding: const EdgeInsets.all(UISize.base4x),
                          child: BodyRegular(
                            widget.hintCards[index].card.description,
                            maxLines: 20,
                          ),
                        ),
                      ),
                      front: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: theme.colors.system.surface,
                            width: 4.0,
                          ),
                        ),
                        child: Stack(
                          children: [
                            _CardImage(
                              imageUrl: widget.hintCards[index].card.imageUrl,
                              isSelected: false,
                            ),
                            const _TextBackgroundGradient(),
                            _CardName(cardName: widget.hintCards[index].card.cardName),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: _kCardWidth,
              child: IgnorePointer(
                  child: Row(
                children: [
                  const Spacer(),
                  PageIndicator(
                    controller: pageController,
                    count: widget.hintCards.length,
                    effect: ExpandingDotsEffect(
                      expansionFactor: 2,
                      activeDotColor: theme.colors.system.text,
                      dotColor: theme.colors.system.text.withOpacity(0.2),
                      dotHeight: 8,
                      dotWidth: 8,
                      radius: 4,
                      spacing: 4,
                      offset: 0,
                    ),
                  ),
                  const Spacer(),
                ],
              )),
            ),
            if (widget.hintCards[0].canBeChoosen)
              Positioned(
                  left: 0,
                  top: 0,
                  child: TouchableOpacity(
                    onPressed: () => widget.onPressed(HintCardModel(
                      card: widget.hintCards[currentPage].card,
                      hintStatus: HintStatus.notConnected,
                    )),
                    child: Container(
                      width: UISize.base10x,
                      decoration: BoxDecoration(
                        boxShadow: UIShadow.button,
                        shape: BoxShape.circle,
                        color: theme.colors.system.background,
                      ),
                      child: AppIcons.notConnectd(
                        size: UISize.base10x,
                        color: theme.colors.system.secondary,
                      ),
                    ),
                  )),
            if (widget.hintCards[0].canBeChoosen)
              Positioned(
                  right: 0,
                  top: 0,
                  child: TouchableOpacity(
                    onPressed: () => widget.onPressed(HintCardModel(
                      card: widget.hintCards[currentPage].card,
                      hintStatus: HintStatus.connected,
                    )),
                    child: Container(
                      width: UISize.base10x,
                      decoration: BoxDecoration(
                        boxShadow: UIShadow.button,
                        shape: BoxShape.circle,
                        color: theme.colors.system.background,
                      ),
                      child: AppIcons.connected(
                        size: UISize.base10x,
                        color: theme.colors.system.primary,
                      ),
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}

class _CardName extends StatelessWidget {
  const _CardName({
    required this.cardName,
  });

  final String cardName;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: UISize.base4x,
        right: UISize.base2x,
        left: UISize.base2x,
        child: Title3(
          cardName,
          maxLines: 4,
          textAlign: TextAlign.center,
        ));
  }
}

class _TextBackgroundGradient extends StatelessWidget {
  const _TextBackgroundGradient();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          stops: const [0, 1],
          colors: [
            theme.colors.system.dark.withOpacity(0.9),
            theme.colors.system.dark.withOpacity(0),
          ],
        ),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({required this.isSelected, required this.imageUrl});

  final bool isSelected;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    if (isSelected) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(
          theme.colors.system.primary,
          BlendMode.modulate,
        ),
        child: ColorFiltered(
          colorFilter: const ColorFilter.linearToSrgbGamma(),
          child: Container(
            color: theme.colors.system.surface,
            width: _kCardWidth,
            height: _kCardHeight,
            child: Image.network(
              imageUrl,
              height: _kCardHeight,
              width: _kCardWidth,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    } else {
      return Container(
        color: theme.colors.system.surface,
        width: _kCardWidth,
        height: _kCardHeight,
        child: Image.network(
          imageUrl,
          height: _kCardHeight,
          width: _kCardWidth,
          fit: BoxFit.cover,
        ),
      );
    }
  }
}

class ExpandingDotsEffect extends BasicIndicatorEffect {
  final double expansionFactor;

  const ExpandingDotsEffect({
    required this.expansionFactor,
    required double offset,
    required double dotWidth,
    required double dotHeight,
    required Color activeDotColor,
    required Color dotColor,
    required double spacing,
    required double radius,
    PaintingStyle paintStyle = PaintingStyle.fill,
  })  : assert(expansionFactor > 1),
        super(
          dotWidth: dotWidth,
          dotHeight: dotHeight,
          spacing: spacing,
          radius: radius,
          paintStyle: paintStyle,
          dotColor: dotColor,
          activeDotColor: activeDotColor,
        );

  @override
  Size calculateSize(int count) {
    // Add the expanded dot width to our size calculation
    return Size(((dotWidth + spacing) * (count - 1)) + (expansionFactor * dotWidth), dotHeight);
  }

  @override
  IndicatorPainter buildPainter(int count, double offset) {
    return ExpandingDotsPainter(count: count, offset: offset, effect: this);
  }

  @override
  int hitTestDots(double dx, int count, double current) {
    var anchor = -spacing / 2;
    for (var index = 0; index < count; index++) {
      final widthBound = (index == current ? (dotWidth * expansionFactor) : dotWidth) + spacing;
      if (dx <= (anchor += widthBound)) {
        return index;
      }
    }
    return -1;
  }
}

abstract class BasicIndicatorPainter extends IndicatorPainter {
  final int count;
  final BasicIndicatorEffect _effect;
  final Paint dotPaint;
  final Radius dotRadius;

  BasicIndicatorPainter(
    double offset,
    this.count,
    this._effect,
  )   : dotRadius = Radius.circular(_effect.radius),
        dotPaint = Paint()
          ..color = _effect.dotColor
          ..style = _effect.paintStyle,
        super(offset);

  double get distance => _effect.dotWidth + _effect.spacing;

  void paintStillDots(Canvas canvas, Size size) {
    for (var i = 0; i < count; i++) {
      final xPos = i * distance;
      final yPos = size.height / 2;
      final bounds = Rect.fromLTRB(
        xPos,
        yPos - _effect.dotHeight / 2,
        xPos + _effect.dotWidth,
        yPos + _effect.dotHeight / 2,
      );
      final rect = RRect.fromRectAndRadius(bounds, dotRadius);
      canvas.drawRRect(rect, dotPaint);
    }
  }

  RRect calcPortalTravel(Size size, double offset, double dotOffset) {
    final yPos = size.height / 2;
    final width = dotOffset * (_effect.dotHeight / 2);
    final height = dotOffset * (_effect.dotWidth / 2);
    final xPos = offset;

    return RRect.fromLTRBR(
      xPos - height,
      yPos - width,
      xPos + height,
      yPos + width,
      Radius.circular(dotRadius.x * dotOffset),
    );
  }
}

abstract class IndicatorPainter extends CustomPainter {
  /// The raw offset from the [PageController].page
  final double offset;

  const IndicatorPainter(this.offset);

  @override
  bool shouldRepaint(IndicatorPainter oldDelegate) {
    // only repaint if the offset changes
    return oldDelegate.offset != offset;
  }
}

abstract class IndicatorEffect {
  const IndicatorEffect();
  IndicatorPainter buildPainter(int count, double offset);
  Size calculateSize(int count);
  int hitTestDots(double dx, int count, double current);
}

abstract class BasicIndicatorEffect extends IndicatorEffect {
  final double dotWidth;
  final double dotHeight;
  final double spacing;
  final double radius;
  final Color dotColor;
  final Color activeDotColor;
  final PaintingStyle paintStyle;

  const BasicIndicatorEffect({
    required this.dotWidth,
    required this.dotHeight,
    required this.spacing,
    required this.radius,
    required this.dotColor,
    required this.paintStyle,
    required this.activeDotColor,
  }) : assert(dotWidth >= 0 && dotHeight >= 0 && spacing >= 0);

  @override
  Size calculateSize(int count) {
    return Size(dotWidth * count + (spacing * (count - 1)), dotHeight);
  }

  @override
  int hitTestDots(double dx, int count, double current) {
    var offset = -spacing / 2;
    for (var index = 0; index < count; index++) {
      if (dx <= (offset += dotWidth + spacing)) {
        return index;
      }
    }
    return -1;
  }
}

class ExpandingDotsPainter extends BasicIndicatorPainter {
  final ExpandingDotsEffect effect;

  ExpandingDotsPainter({
    required double offset,
    required this.effect,
    required int count,
  }) : super(offset, count, effect);

  @override
  void paint(Canvas canvas, Size size) {
    final current = offset.floor();
    var drawingOffset = -effect.spacing;
    final dotOffset = offset - current;

    for (var i = 0; i < count; i++) {
      var color = effect.dotColor;
      final activeDotWidth = effect.dotWidth * effect.expansionFactor;
      final xPos = drawingOffset + effect.spacing;
      var width = effect.dotWidth;
      if (i == current) {
        color = Color.lerp(effect.activeDotColor, effect.dotColor, dotOffset)!;
        width = activeDotWidth - dotOffset / 2 * ((activeDotWidth - effect.dotWidth) / 0.5);
      } else if (i - 1 == current || (i == 0 && offset > count - 1)) {
        width = effect.dotWidth + dotOffset / 2 * ((activeDotWidth - effect.dotWidth) / 0.5);
        color = Color.lerp(effect.activeDotColor, effect.dotColor, 1.0 - dotOffset)!;
      }
      final yPos = size.height / 2;
      final rRect = RRect.fromLTRBR(
        xPos,
        yPos - effect.dotHeight / 2,
        xPos + width,
        yPos + effect.dotHeight / 2,
        dotRadius,
      );
      drawingOffset = rRect.right;
      canvas.drawRRect(rRect, dotPaint..color = color);
    }
  }
}

class PageIndicator extends AnimatedWidget {
  final PageController controller;
  final IndicatorEffect effect;
  final int count;
  final TextDirection? textDirection;

  const PageIndicator({
    required this.controller,
    required this.count,
    required this.effect,
    this.textDirection,
    Key? key,
  }) : super(
          key: key,
          listenable: controller,
        );

  @override
  Widget build(BuildContext context) {
    return Indicator(
      offset: _offset,
      count: count,
      effect: effect,
      textDirection: textDirection,
    );
  }

  double get _offset {
    try {
      final offset = controller.page ?? controller.initialPage.toDouble();
      return offset % count;
    } catch (e) {
      return controller.initialPage.toDouble();
    }
  }
}

class Indicator extends StatelessWidget {
  final double offset;
  final IndicatorEffect effect;
  final int count;
  final TextDirection? textDirection;
  final Size _size;

  Indicator({
    required this.offset,
    required this.count,
    required this.effect,
    this.textDirection,
    Key? key,
  })  : _size = effect.calculateSize(count),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: _size,
      // Ребилдит Painter с новым значением Offset каждый раз, когда он обновляется
      painter: effect.buildPainter(count, offset),
    );
  }
}
