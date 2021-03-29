import '../extensions/string_ext.dart';

class Pokemon {
  late final int id;
  final String name;
  final String url;

  Pokemon({
    required this.name,
    required this.url,
  }) {
    int? idFromUrl = RegExp('[^/]+(?=[\\/]\$|\$)').stringMatch(url)?.parseInt();
    if (idFromUrl == null) {
      throw Exception('Invalid id parsed from url: $url');
    }
    this.id = idFromUrl;
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      Pokemon(name: json['name'], url: json['url']);

  String getImageUrl() =>
      'https://pokeres.bastionbot.org/images/pokemon/$id.png';
}
