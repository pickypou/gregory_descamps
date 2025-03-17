class AvisClientsDto {
  final String id;
  final String text;
  final String firstname;
  final DateTime publishDate;

  AvisClientsDto({
    required this.id,
    required this.text,
    required this.firstname,
    required this.publishDate,
  });

  factory AvisClientsDto.fromJson(Map<String, dynamic> json) {
    return AvisClientsDto(
      id: json['id'],
      text: json['text'],
      firstname: json['firstname'],
      publishDate: DateTime.parse(json['publishDate']), // Assurez-vous que le format est correct
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'firstname': firstname,
      'publishDate': publishDate.toIso8601String(), // Convertir DateTime en String
    };
  }

  @override
  String toString() {
    return 'AvisClientsDto{id: $id, text: $text, firstname: $firstname, publishDate: $publishDate}';
  }
}