// lib/core/widgets/app_button.dart
import 'package:core/theme/styles/widget_styles.dart';
import 'package:flutter/material.dart';

class PokeButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final WidgetSize size;
  final WidgetType type;
  final IconData? icon;
  final bool isLoading;
  final bool isFullWidth;

  PokeButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.size = WidgetSize.medium,
    this.type = WidgetType.filled,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final padding = WidgetStyles.getPadding(size);
    final style = WidgetStyles.getButtonStyle(
      size: size,
      type: type,
      colorScheme: colorScheme,
    );

    Widget button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: style,
      child: Padding(padding: padding, child: _buildContent(colorScheme)),
    );

    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }

  Widget _buildContent(ColorScheme colorScheme) {
    if (isLoading) {
      return SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(
            WidgetStyles.getLoadingColor(type, colorScheme),
          ),
        ),
      );
    } else if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: WidgetStyles.getIconSize(size)),
          SizedBox(width: 8.0),
          Text(
            label,
            style: WidgetStyles.getTextStyle(
              size: size,
              type: type,
              colorScheme: colorScheme,
            ),
          ),
        ],
      );
    }
    return Text(
      label,
      style: WidgetStyles.getTextStyle(
        size: size,
        type: type,
        colorScheme: colorScheme,
      ),
    );
  }
}
