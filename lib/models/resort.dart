class ResortsList {
  ResortsList({
    required this.listOfResorts,
  });

  late final List<Resort> listOfResorts;

  ResortsList.fromJson(Map<String, dynamic> json) {
    listOfResorts =
        List.from(json['data']).map((e) => Resort.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = listOfResorts.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Resort {
  Resort({
    required this.slug,
    required this.name,
    required this.country,
    required this.region,
    required this.location,
    required this.url,
  });
  late final String slug;
  double elevation = double.negativeInfinity;
  late final String name;
  late final String country;
  late final String region;
  late final LocationModel location;
  late final String url;

  Resort.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    country = json['country'];
    region = json['region'];
    location = LocationModel.fromJson(json['location']);
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slug'] = slug;
    _data['name'] = name;
    _data['country'] = country;
    _data['region'] = region;
    _data['location'] = location.toJson();
    _data['url'] = url;
    return _data;
  }
}

class LocationModel {
  LocationModel({
    required this.latitude,
    required this.longitude,
  });
  late final double latitude;
  late final double longitude;

  LocationModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    return _data;
  }
}
