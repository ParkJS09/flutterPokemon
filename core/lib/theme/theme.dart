import 'package:flutter/material.dart';
import 'tokens/colors.dart';
import 'tokens/typography.dart';
import 'tokens/radius.dart';
import 'tokens/spacing.dart';
import 'styles/text_styles.dart';
import 'styles/component_styles.dart';

class AppTheme {
  // 테마 변경 시 호출할 메서드
  static void updateThemeMode(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    AppColors.setDarkMode(isDark);
  }

  // 라이트 테마 설정
  static ThemeData get lightTheme {
    AppColors.setDarkMode(false);
    return ThemeData(
      brightness: Brightness.light,
      // 기본 브랜드 컬러 설정
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.background,
        onSurface: AppColors.textPrimary,
      ),

      // 기본 설정
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Poppins',

      // 텍스트 테마
      textTheme: TextTheme(
        displayLarge: AppTextStyles.title,
        displayMedium: AppTextStyles.subtitle,
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.caption,
      ),

      // AppBar 테마
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: AppTypography.lg,
          fontWeight: AppTypography.bold,
          color: Colors.white,
        ),
      ),

      // 카드 테마
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),

      // 버튼 테마
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
        ),
      ),

      // 입력 필드 테마
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppSpacing.md),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
        filled: true,
        fillColor: Colors.white,
      ),

      // 리스트타일 테마
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
      ),

      // 탭바 테마
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.textSecondary,
        labelStyle: TextStyle(
          fontSize: AppTypography.md,
          fontWeight: AppTypography.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: AppTypography.md,
          fontWeight: AppTypography.regular,
        ),
      ),
    );
  }

  // 다크 테마 설정
  static ThemeData get darkTheme {
    AppColors.setDarkMode(true);
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      // 기본 브랜드 컬러 설정
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.neutral200,
        onSurface: AppColors.textPrimary,
      ),

      // 기본 설정
      scaffoldBackgroundColor: AppColors.background,

      // 텍스트 테마
      textTheme: TextTheme(
        displayLarge: AppTextStyles.title,
        displayMedium: AppTextStyles.subtitle,
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.caption,
      ),

      // AppBar 테마
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.neutral100,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: AppTypography.lg,
          fontWeight: AppTypography.bold,
          color: AppColors.textPrimary,
        ),
      ),

      // 카드 테마
      cardTheme: CardTheme(
        color: AppColors.neutral200,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),

      // 버튼 테마
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
        ),
      ),

      // 입력 필드 테마
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppSpacing.md),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
        filled: true,
        fillColor: AppColors.neutral300,
      ),

      // 리스트타일 테마
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        tileColor: AppColors.neutral200,
      ),

      // 탭바 테마
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.textSecondary,
        labelStyle: TextStyle(
          fontSize: AppTypography.md,
          fontWeight: AppTypography.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: AppTypography.md,
          fontWeight: AppTypography.regular,
        ),
      ),

      // 다이얼로그 테마
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.neutral200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    );
  }

  // 현재 테마가 다크모드인지 확인하는 헬퍼 메서드
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
