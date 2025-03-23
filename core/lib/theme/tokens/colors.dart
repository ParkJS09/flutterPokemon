import 'package:flutter/material.dart';

class AppColors {
  // 현재 테마 모드
  static bool _isDarkMode = false;

  // 테마 모드 설정 메서드
  static void setDarkMode(bool isDark) {
    _isDarkMode = isDark;
  }

  // 테마에 따른 색상 반환 헬퍼 메서드
  static Color getColor(Color lightColor, Color darkColor) {
    return _isDarkMode ? darkColor : lightColor;
  }

  // 앱 기본 색상 (라이트/다크 모드)
  static Color get primary =>
      getColor(const Color(0xFFFF5350), const Color(0xFFF44336));
  static Color get secondary =>
      getColor(const Color(0xFF3D7DCA), const Color(0xFF2196F3));
  static Color get accent =>
      getColor(const Color(0xFFFFDE00), const Color(0xFFFFD600));
  static Color get textPrimary =>
      getColor(const Color(0xFF555555), Colors.white);
  static Color get textSecondary =>
      getColor(const Color(0xFF777777), Colors.white70);
  static Color get background =>
      getColor(const Color(0xFFF8F8F8), const Color(0xFF121212));

  // 보조 색상
  static Color get primaryLight => getColor(
    const Color(0xFFFF7F7E),
    const Color(0xFFFF7F7E).withOpacity(0.8),
  );
  static Color get primaryDark =>
      getColor(const Color(0xFFCC4240), const Color(0xFFD32F2F));
  static Color get secondaryLight =>
      getColor(const Color(0xFF75A5DB), const Color(0xFF64B5F6));
  static Color get secondaryDark =>
      getColor(const Color(0xFF2D5D9A), const Color(0xFF1976D2));
  static Color get accentLight =>
      getColor(const Color(0xFFFFE966), const Color(0xFFFFEA00));
  static Color get accentDark =>
      getColor(const Color(0xFFD4B800), const Color(0xFFFBC02D));

  // 중성 색상
  static Color get neutral50 =>
      getColor(const Color(0xFFFAFAFA), const Color(0xFF424242));
  static Color get neutral100 =>
      getColor(const Color(0xFFF5F5F5), const Color(0xFF303030));
  static Color get neutral200 =>
      getColor(const Color(0xFFEEEEEE), const Color(0xFF282828));
  static Color get neutral300 =>
      getColor(const Color(0xFFE0E0E0), const Color(0xFF242424));
  static Color get neutral400 =>
      getColor(const Color(0xFFBDBDBD), const Color(0xFF404040));
  static Color get neutral500 =>
      getColor(const Color(0xFF9E9E9E), const Color(0xFF757575));
  static Color get neutral600 =>
      getColor(const Color(0xFF757575), const Color(0xFF9E9E9E));
  static Color get neutral700 =>
      getColor(const Color(0xFF616161), const Color(0xFFBDBDBD));
  static Color get neutral800 =>
      getColor(const Color(0xFF424242), const Color(0xFFE0E0E0));
  static Color get neutral900 =>
      getColor(const Color(0xFF212121), Colors.white);

  // 피드백 색상
  static Color get success =>
      getColor(const Color(0xFF4CAF50), const Color(0xFF81C784));
  static Color get error =>
      getColor(const Color(0xFFF44336), const Color(0xFFE57373));
  static Color get warning =>
      getColor(const Color(0xFFFFC107), const Color(0xFFFFD54F));
  static Color get info =>
      getColor(const Color(0xFF2196F3), const Color(0xFF64B5F6));

  // 그라데이션용 색상
  static Color get gradientStart =>
      getColor(const Color(0xFFFF5350), const Color(0xFFF44336));
  static Color get gradientEnd =>
      getColor(const Color(0xFFFF7F7E), const Color(0xFFEF9A9A));

  // 상태 표시 색상
  static Color get activeState =>
      getColor(const Color(0xFF4CAF50), const Color(0xFF81C784));
  static Color get inactiveState =>
      getColor(const Color(0xFF9E9E9E), const Color(0xFF757575));
  static Color get focusState =>
      getColor(const Color(0xFF3D7DCA), const Color(0xFF64B5F6));

  // 포켓몬 타입 색상 - 타입 색상은 다크 모드에서도 일관성을 유지하기 위해 동일하게 유지
  static final Map<String, Color> typeColors = {
    'normal': const Color(0xFFA8A878),
    'fire': const Color(0xFFF08030),
    'water': const Color(0xFF6890F0),
    'grass': const Color(0xFF78C850),
    'electric': const Color(0xFFF8D030),
    'ice': const Color(0xFF98D8D8),
    'fighting': const Color(0xFFC03028),
    'poison': const Color(0xFF705898),
    'ground': const Color(0xFFB8A038),
    'flying': const Color(0xFFA890F0),
    'psychic': const Color(0xFFF85888),
    'bug': const Color(0xFFA8B820),
    'rock': const Color(0xFFB8A038),
    'ghost': const Color(0xFF705898),
    'dark': const Color(0xFF705848),
    'dragon': const Color(0xFF7038F8),
    'steel': const Color(0xFFB8B8D0),
    'fairy': const Color(0xFFF0B6BC),
  };

  // 능력치 색상 - 통계 색상도 시각적 일관성을 위해 그대로 유지
  static const Color statHP = Color(0xFFFF5959);
  static const Color statAttack = Color(0xFFF5AC78);
  static const Color statDefense = Color(0xFFFAE078);
  static const Color statSpAtk = Color(0xFF9DB7F5);
  static const Color statSpDef = Color(0xFFA7DB8D);
  static const Color statSpeed = Color(0xFFFA92B2);
}
