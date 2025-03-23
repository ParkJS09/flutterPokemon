import 'package:core/theme/tokens/colors.dart';
import 'package:core/theme/tokens/typography.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  // 제목 스타일
  static TextStyle get title => TextStyle(
    fontSize: AppTypography.xxl,
    fontWeight: AppTypography.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get subtitle =>
      TextStyle(fontSize: AppTypography.lg, color: AppColors.textSecondary);

  // 본문 스타일
  static TextStyle get body =>
      TextStyle(fontSize: AppTypography.md, color: AppColors.textPrimary);

  static TextStyle get bodyBold => TextStyle(
    fontSize: AppTypography.md,
    fontWeight: AppTypography.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get caption =>
      TextStyle(fontSize: AppTypography.sm, color: AppColors.textSecondary);

  // 버튼 스타일
  static TextStyle get buttonText => TextStyle(
    fontSize: AppTypography.md,
    fontWeight: AppTypography.semiBold,
    color: Colors.white,
  );

  static TextStyle get buttonTextSmall => TextStyle(
    fontSize: AppTypography.sm,
    fontWeight: AppTypography.medium,
    color: Colors.white,
  );

  // 입력 필드 스타일
  static TextStyle get inputText =>
      TextStyle(fontSize: AppTypography.md, color: AppColors.textPrimary);

  static TextStyle get inputLabel => TextStyle(
    fontSize: AppTypography.sm,
    fontWeight: AppTypography.medium,
    color: AppColors.textSecondary,
  );

  static TextStyle get inputHint => TextStyle(
    fontSize: AppTypography.md,
    color: AppColors.textSecondary.withOpacity(0.7),
  );

  static TextStyle get inputError =>
      TextStyle(fontSize: AppTypography.sm, color: AppColors.error);

  // 헤더 스타일
  static TextStyle get header1 => TextStyle(
    fontSize: AppTypography.xxl + 4,
    fontWeight: AppTypography.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get header2 => TextStyle(
    fontSize: AppTypography.xxl,
    fontWeight: AppTypography.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get header3 => TextStyle(
    fontSize: AppTypography.xl,
    fontWeight: AppTypography.semiBold,
    color: AppColors.textPrimary,
  );

  // 리스트 스타일
  static TextStyle get listTitle => TextStyle(
    fontSize: AppTypography.lg,
    fontWeight: AppTypography.medium,
    color: AppColors.textPrimary,
  );

  static TextStyle get listSubtitle =>
      TextStyle(fontSize: AppTypography.md, color: AppColors.textSecondary);

  // 포켓몬 관련 특수 스타일
  static TextStyle get pokemonName => TextStyle(
    fontSize: AppTypography.xl,
    fontWeight: AppTypography.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get pokemonNumber => TextStyle(
    fontSize: AppTypography.md,
    fontWeight: AppTypography.semiBold,
    color: AppColors.textSecondary,
  );

  static TextStyle get pokemonType => TextStyle(
    fontSize: AppTypography.sm,
    fontWeight: AppTypography.medium,
    color: Colors.white,
  );

  static TextStyle get pokemonStat => TextStyle(
    fontSize: AppTypography.md,
    fontWeight: AppTypography.medium,
    color: AppColors.textPrimary,
  );

  // 링크 스타일
  static TextStyle get link => TextStyle(
    fontSize: AppTypography.md,
    color: AppColors.secondary,
    decoration: TextDecoration.underline,
  );

  // 헬퍼 메서드: 텍스트 스타일 색상 변경
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  // 헬퍼 메서드: 텍스트 스타일 크기 변경
  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }

  // 헬퍼 메서드: 텍스트 스타일 굵기 변경
  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }
}
