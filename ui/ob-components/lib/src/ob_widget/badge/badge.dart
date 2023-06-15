import 'package:flutter/material.dart';

///
class Badge extends StatelessWidget {
  ///
  const Badge({
    Key? key,
    this.showZero = false,
    this.dot = false,
    this.overflowCount = 99,
    this.count,
    this.color = const Color(0xffFF5722),
    this.child,
    this.countConstraints =
        const BoxConstraints(minWidth: 14, maxHeight: 14, minHeight: 14),
    this.dotConstraints = const BoxConstraints.tightFor(width: 8, height: 8),
    this.style = const TextStyle(fontSize: 10, color: Colors.white),
  }) : super(key: key);

  ///
  final bool showZero;

  ///
  final bool dot;

  ///
  final num overflowCount;

  ///
  final num? count;

  ///
  final Color color;

  ///
  final BoxConstraints countConstraints;

  ///
  final BoxConstraints dotConstraints;

  ///
  final TextStyle style;

  ///
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final String numberedDisplayCount =
        (count ?? 0) > overflowCount ? '$overflowCount+' : '${count ?? 0}';
    final bool isZero = numberedDisplayCount == '0';
    final bool showAsDot = dot && !isZero;
    final String mergedCount = showAsDot ? '' : numberedDisplayCount;
    final bool isHidden =
        (mergedCount.isEmpty || (isZero && !showZero)) && !showAsDot;
    final Widget badge = isHidden
        ? const SizedBox.shrink()
        : showAsDot
            ? dotBadge
            : _getCountBadge(mergedCount);
    return child == null
        ? badge
        : Stack(
            fit: StackFit.passthrough,
            clipBehavior: Clip.none,
            children: <Widget>[
              child!,
              PositionedDirectional(
                top: 0,
                end: 0,
                child: FractionalTranslation(
                  translation: const Offset(0.5, -0.5),
                  child: badge,
                ),
              ),
            ],
          );
  }

  Widget _getCountBadge(String count) {
    return Container(
      constraints: countConstraints,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: color,
      ),
      child: Center(
        child: Text(
          count,
          textAlign: TextAlign.center,
          style: style.merge(
            const TextStyle(
              fontFamily: 'DIN-Medium',
              package: 'ob_component',
            ),
          ),
        ),
      ),
    );
  }

  ///
  Widget get dotBadge {
    return Container(
      constraints: dotConstraints,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
