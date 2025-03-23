import 'package:core/theme/tokens/radius.dart';
import 'package:core/theme/tokens/spacing.dart';
import 'package:core/theme/tokens/typography.dart';
import 'package:flutter/material.dart';

/// 위젯 스타일을 관리하는 범용 유틸리티 클래스
/// 앱의 모든 위젯에서 사용할 수 있는 스타일 로직을 제공합니다.
class WidgetStyles {
  // 사이즈에 따른 패딩 계산 (버튼, 카드, 칩 등에서 사용)
  static EdgeInsets getPadding(WidgetSize size) {
    switch (size) {
      case WidgetSize.small:
        return EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        );
      case WidgetSize.large:
        return EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.md,
        );
      case WidgetSize.medium:
      default:
        return EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        );
    }
  }

  // 사이즈에 따른 아이콘 크기 계산
  static double getIconSize(WidgetSize size) {
    switch (size) {
      case WidgetSize.small:
        return 16.0;
      case WidgetSize.large:
        return 24.0;
      case WidgetSize.medium:
      default:
        return 20.0;
    }
  }

  // 사이즈에 따른 폰트 크기 계산
  static double getFontSize(WidgetSize size) {
    switch (size) {
      case WidgetSize.small:
        return AppTypography.sm;
      case WidgetSize.large:
        return AppTypography.lg;
      case WidgetSize.medium:
      default:
        return AppTypography.md;
    }
  }

  // 사이즈에 따른 테두리 반경 계산
  static double getBorderRadius(WidgetSize size) {
    switch (size) {
      case WidgetSize.small:
        return AppRadius.sm;
      case WidgetSize.large:
        return AppRadius.lg;
      case WidgetSize.medium:
      default:
        return AppRadius.md;
    }
  }

  // 범용 텍스트 스타일 (위젯 타입과 색상 스키마에 따라)
  static TextStyle getTextStyle({
    required WidgetSize size,
    required WidgetType type,
    required ColorScheme colorScheme,
    FontWeight? fontWeight,
  }) {
    final baseFontSize = getFontSize(size);
    final weight = fontWeight ?? FontWeight.w600;

    switch (type) {
      case WidgetType.filled:
        return TextStyle(
          fontSize: baseFontSize,
          fontWeight: weight,
          color: Colors.white,
        );
      case WidgetType.outlined:
        return TextStyle(
          fontSize: baseFontSize,
          fontWeight: weight,
          color: colorScheme.primary,
        );
      case WidgetType.text:
        return TextStyle(
          fontSize: baseFontSize,
          fontWeight: weight,
          color: colorScheme.primary,
        );
      case WidgetType.tonal:
        return TextStyle(
          fontSize: baseFontSize,
          fontWeight: weight,
          color: colorScheme.onSecondaryContainer,
        );
    }
  }

  // 버튼 스타일 계산
  static ButtonStyle getButtonStyle({
    required WidgetSize size,
    required WidgetType type,
    required ColorScheme colorScheme,
  }) {
    final borderRadius = BorderRadius.circular(getBorderRadius(size));

    switch (type) {
      case WidgetType.filled:
        return ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          elevation: 2,
        );
      case WidgetType.outlined:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: BorderSide(color: colorScheme.primary),
          ),
          elevation: 0,
        );
      case WidgetType.text:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          elevation: 0,
          shadowColor: Colors.transparent,
        );
      case WidgetType.tonal:
        return ElevatedButton.styleFrom(
          backgroundColor: colorScheme.secondaryContainer,
          foregroundColor: colorScheme.onSecondaryContainer,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          elevation: 1,
        );
    }
  }

  // 카드 스타일 계산
  static BoxDecoration getCardDecoration({
    required WidgetSize size,
    required WidgetType type,
    required ColorScheme colorScheme,
  }) {
    final borderRadius = BorderRadius.circular(getBorderRadius(size));

    switch (type) {
      case WidgetType.filled:
        return BoxDecoration(
          color: colorScheme.surface,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        );
      case WidgetType.outlined:
        return BoxDecoration(
          color: colorScheme.surface,
          borderRadius: borderRadius,
          border: Border.all(color: colorScheme.outline),
        );
      case WidgetType.tonal:
        return BoxDecoration(
          color: colorScheme.secondaryContainer,
          borderRadius: borderRadius,
        );
      case WidgetType.text:
      default:
        return BoxDecoration(
          color: colorScheme.surface,
          borderRadius: borderRadius,
        );
    }
  }

  // 칩 스타일 계산
  static ChipThemeData getChipTheme({
    required WidgetSize size,
    required WidgetType type,
    required ColorScheme colorScheme,
  }) {
    final borderRadius = BorderRadius.circular(getBorderRadius(size));

    switch (type) {
      case WidgetType.filled:
        return ChipThemeData(
          backgroundColor: colorScheme.primary,
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: getFontSize(size),
          ),
          padding: getPadding(size),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        );
      case WidgetType.outlined:
        return ChipThemeData(
          backgroundColor: Colors.transparent,
          labelStyle: TextStyle(
            color: colorScheme.primary,
            fontSize: getFontSize(size),
          ),
          padding: getPadding(size),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: BorderSide(color: colorScheme.primary),
          ),
        );
      case WidgetType.tonal:
        return ChipThemeData(
          backgroundColor: colorScheme.secondaryContainer,
          labelStyle: TextStyle(
            color: colorScheme.onSecondaryContainer,
            fontSize: getFontSize(size),
          ),
          padding: getPadding(size),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        );
      case WidgetType.text:
      default:
        return ChipThemeData(
          backgroundColor: colorScheme.surface,
          labelStyle: TextStyle(
            color: colorScheme.onSurface,
            fontSize: getFontSize(size),
          ),
          padding: getPadding(size),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        );
    }
  }

  // 아바타 스타일
  static BoxDecoration getAvatarDecoration({
    required WidgetSize size,
    required ColorScheme colorScheme,
  }) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: colorScheme.primaryContainer,
    );
  }

  // 로딩 인디케이터 색상
  static Color getLoadingColor(WidgetType type, ColorScheme colorScheme) {
    switch (type) {
      case WidgetType.filled:
        return Colors.white;
      case WidgetType.outlined:
      case WidgetType.text:
        return colorScheme.primary;
      case WidgetType.tonal:
        return colorScheme.onSecondaryContainer;
    }
  }
}

// 위젯 사이즈 열거형 (모든 위젯에서 공유)
enum WidgetSize { small, medium, large }

// 위젯 타입 열거형 (Material 3 디자인 시스템 기반)
enum WidgetType { filled, outlined, text, tonal }
