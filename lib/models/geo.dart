import 'dart:convert';

class Geo {
  final String lat;
  final String lng;
  Geo({
    required this.lat,
    required this.lng,
  });

  Geo copyWith({
    String? lat,
    String? lng,
  }) {
    return Geo(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
    };
  }

  factory Geo.fromMap(Map<String, dynamic> map) {
    return Geo(
      lat: map['lat'] as String,
      lng: map['lng'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Geo.fromJson(String source) => Geo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Geo(lat: $lat, lng: $lng)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Geo &&
      other.lat == lat &&
      other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}