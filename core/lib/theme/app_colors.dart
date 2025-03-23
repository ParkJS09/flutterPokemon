import 'package:flutter/material.dart';

class AppColors {
  // 앱 기본 색상
  static const Color primary = Color(0xFFFF5350); // 포켓몬 레드
  static const Color secondary = Color(0xFF3D7DCA); // 포켓몬 블루
  static const Color accent = Color(0xFFFFDE00); // 포켓몬 옐로우
  static const Color textPrimary = Color(0xFF555555); // 텍스트 기본
  static const Color background = Color(0xFFF8F8F8); // 배경 색상

  // 포켓몬 타입 색상
  static const Map<String, Color> typeColors = {
    'normal': Color(0xFFA8A878),
    'fire': Color(0xFFF08030),
    'water': Color(0xFF6890F0),
    'grass': Color(0xFF78C850),
    'electric': Color(0xFFF8D030),
    'ice': Color(0xFF98D8D8),
    'fighting': Color(0xFFC03028),
    'poison': Color(0xFF705898),
    'ground': Color(0xFFB8A038),
    'flying': Color(0xFFA890F0),
    'psychic': Color(0xFFF85888),
    'bug': Color(0xFFA8B820),
    'rock': Color(0xFFB8A038),
    'ghost': Color(0xFF705898),
    'dark': Color(0xFF705848),
    'dragon': Color(0xFF7038F8),
    'steel': Color(0xFFB8B8D0),
    'fairy': Color(0xFFF0B6BC),
  };

  // 능력치 색상
  static const Color statHP = Color(0xFFFF5959);
  static const Color statAttack = Color(0xFFF5AC78);
  static const Color statDefense = Color(0xFFFAE078);
  static const Color statSpAtk = Color(0xFF9DB7F5);
  static const Color statSpDef = Color(0xFFA7DB8D);
  static const Color statSpeed = Color(0xFFFA92B2);
}
