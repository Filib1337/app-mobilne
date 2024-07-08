class Brew {
  String sugars;
  String name;
  int strength;

  Brew({
    required this.sugars,
    required this.name,
    required this.strength,
  });

  factory Brew.fromJson(Map<String, dynamic> json) {
    return Brew(
      sugars: json['sugars'],
      name: json['name'],
      strength: json['strength'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sugars': sugars,
      'name': name,
      'strength': strength,
    };
  }
}
