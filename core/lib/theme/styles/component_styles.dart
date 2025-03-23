import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/radius.dart';
import '../tokens/spacing.dart';

class ComponentStyles {
  // 버튼 스타일
  static final ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    padding: EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.md,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
    ),
  );

  // 카드 스타일
  static final CardTheme cardStyle = CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
    ),
    color: Colors.white,
    margin: EdgeInsets.all(AppSpacing.sm),
  );

  // 입력 필드 스타일
  static final InputDecoration inputStyle = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.sm),
    ),
    contentPadding: EdgeInsets.all(AppSpacing.md),
    filled: true,
    fillColor: Colors.white,
  );

  // 리스트 타일 스타일
  static final ListTileThemeData listTileStyle = ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.sm,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.sm),
    ),
  );
}
