class PokemonDetails {
  final int height;
  final int weight;
  final int hp;
  final int attack;
  final int defense;
  final int speed;
  final int baseExperience;

  PokemonDetails({
    required this.height,
    required this.weight,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.speed,
    required this.baseExperience,
  });

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => PokemonDetails(
        height: json['height'],
        weight: json['weight'],
        hp: json['stats'][0]['base_stat'],
        attack: json['stats'][1]['base_stat'],
        defense: json['stats'][2]['base_stat'],
        speed: json['stats'][5]['base_stat'],
        baseExperience: json['base_experience'],
      );
}
