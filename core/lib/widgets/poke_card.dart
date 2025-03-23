import 'package:flutter/material.dart';
import 'package:core/theme/styles/widget_styles.dart';

class PokeCard extends StatelessWidget {
  final Widget child;
  final WidgetSize size;
  final WidgetType type;
  final EdgeInsets? padding;

  const PokeCard({
    Key? key,
    required this.child,
    this.size = WidgetSize.medium,
    this.type = WidgetType.filled,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cardPadding = padding ?? WidgetStyles.getPadding(size);
    final decoration = WidgetStyles.getCardDecoration(
      size: size,
      type: type,
      colorScheme: colorScheme,
    );

    return Container(
      decoration: decoration,
      padding: cardPadding,
      child: child,
    );
  }
}
