import 'package:core/core.dart';
import 'package:flutter/material.dart';

class PokeChip extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final WidgetSize size;
  final WidgetType type;
  final IconData? icon;

  const PokeChip({
    Key? key,
    required this.label,
    this.onTap,
    this.backgroundColor,
    this.textColor,
    this.size = WidgetSize.small,
    this.type = WidgetType.filled,
    this.icon,
  }) : super(key: key);

  /// 포켓몬 타입에 따라 미리 정의된 색상으로 칩을 생성하는 팩토리 메서드
  factory PokeChip.forType(
    String type, {
    Key? key,
    VoidCallback? onTap,
    WidgetSize size = WidgetSize.small,
    IconData? icon,
  }) {
    // 대소문자 구분 없이 타입 이름을 찾기 위해 소문자로 변환
    final typeLower = type.toLowerCase();
    // AppColors.typeColors에서 해당 타입의 색상 가져오기
    final typeColor = AppColors.typeColors[typeLower] ?? AppColors.primary;

    return PokeChip(
      key: key,
      label: type,
      onTap: onTap,
      backgroundColor: typeColor,
      textColor: Colors.white, // 타입 색상 위에 하얀색 텍스트가 잘 보임
      size: size,
      type: WidgetType.filled, // 타입 칩은 항상 filled 스타일 사용
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final chipTheme = WidgetStyles.getChipTheme(
      size: size,
      type: type,
      colorScheme: colorScheme,
    );

    // 배경색 및 텍스트 색상 커스텀 로직 추가
    final theme = Theme.of(context).copyWith(
      chipTheme:
          backgroundColor != null || textColor != null
              ? chipTheme.copyWith(
                backgroundColor: backgroundColor,
                labelStyle: TextStyle(
                  fontSize: size == WidgetSize.small ? 12 : 14,
                  fontWeight: FontWeight.w500,
                  color: textColor ?? Colors.white,
                ),
              )
              : chipTheme,
    );

    return Theme(
      data: theme,
      child: Chip(
        label: Text(label),
        avatar:
            icon != null
                ? Icon(
                  icon,
                  size: WidgetStyles.getIconSize(size),
                  color: textColor,
                )
                : null,
        onDeleted: onTap,
        deleteIcon:
            onTap != null
                ? Icon(Icons.arrow_forward_ios, size: 12, color: textColor)
                : null,
        deleteButtonTooltipMessage: '',
      ),
    );
  }
}
