import 'package:domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required int id,
    required String name,
    required String type,
    required String imageUrl,
  }) : super(id: id, name: name, type: type, imageUrl: imageUrl);

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    // 포켓API의 응답 형식에 맞게 파싱
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      // 첫 번째 타입 가져오기
      type: json['types'][0]['type']['name'],
      // 스프라이트 이미지 URL
      imageUrl: json['sprites']['front_default'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'imageUrl': imageUrl,
      // API가 이 형식을 기대한다면 중첩 구조로 변환할 수도 있습니다
      'types': [
        {
          'type': {'name': type},
        },
      ],
      'sprites': {'front_default': imageUrl},
    };
  }
}
