class ResortSite {
  ResortSite({
    required this.data,
  });
  late final ResortSiteData data;

  ResortSite.fromJson(Map<String, dynamic> json) {
    data = ResortSiteData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class ResortSiteData {
  ResortSiteData({
    required this.slug,
    required this.name,
    required this.country,
    required this.region,
    required this.href,
    required this.units,
    required this.location,
    required this.lifts,
    required this.twitter,
  });
  late final String slug;
  late final String name;
  late final String country;
  late final String region;
  late final String href;
  late final String units;
  late final Location location;
  late final Lifts lifts;
  late final Twitter twitter;

  ResortSiteData.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    country = json['country'];
    region = json['region'];
    href = json['href'];
    units = json['units'];
    location = Location.fromJson(json['location']);
    lifts = Lifts.fromJson(json['lifts']);
    twitter = Twitter.fromJson(json['twitter']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slug'] = slug;
    _data['name'] = name;
    _data['country'] = country;
    _data['region'] = region;
    _data['href'] = href;
    _data['units'] = units;
    _data['location'] = location.toJson();
    _data['lifts'] = lifts.toJson();
    _data['twitter'] = twitter.toJson();
    return _data;
  }
}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
  });
  late final double latitude;
  late final double longitude;

  Location.fromJson(Map<String, dynamic> json) {
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

class Lifts {
  Lifts({
    required this.status,
    required this.stats,
  });
  late final Status status;
  late final Stats stats;

  Lifts.fromJson(Map<String, dynamic> json) {
    status = Status.fromJson(json['status']);
    stats = Stats.fromJson(json['stats']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status.toJson();
    _data['stats'] = stats.toJson();
    return _data;
  }
}

class Status {
  Status();

  Status.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class Stats {
  Stats({
    required this.open,
    required this.hold,
    required this.scheduled,
    required this.closed,
    required this.percentage,
  });
  late final int open;
  late final int hold;
  late final int scheduled;
  late final int closed;
  late final Percentage percentage;

  Stats.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    hold = json['hold'];
    scheduled = json['scheduled'];
    closed = json['closed'];
    percentage = Percentage.fromJson(json['percentage']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['open'] = open;
    _data['hold'] = hold;
    _data['scheduled'] = scheduled;
    _data['closed'] = closed;
    _data['percentage'] = percentage.toJson();
    return _data;
  }
}

class Percentage {
  Percentage({
    required this.open,
    required this.hold,
    required this.scheduled,
    required this.closed,
  });
  late final int open;
  late final int hold;
  late final int scheduled;
  late final int closed;

  Percentage.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    hold = json['hold'];
    scheduled = json['scheduled'];
    closed = json['closed'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['open'] = open;
    _data['hold'] = hold;
    _data['scheduled'] = scheduled;
    _data['closed'] = closed;
    return _data;
  }
}

class Twitter {
  Twitter({
    required this.user,
    required this.tweets,
  });
  late final String user;
  late final List<Tweets> tweets;

  Twitter.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    tweets = List.from(json['tweets']).map((e) => Tweets.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user;
    _data['tweets'] = tweets.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Tweets {
  Tweets({
    required this.text,
    required this.idStr,
    required this.createdAt,
    required this.entities,
    required this.extendedEntities,
  });
  late final String text;
  late final String idStr;
  late final String createdAt;
  late final Entities entities;
  late final ExtendedEntities extendedEntities;

  Tweets.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    idStr = json['id_str'];
    createdAt = json['created_at'];
    entities = Entities.fromJson(json['entities']);
    extendedEntities = ExtendedEntities.fromJson(json['extended_entities']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['id_str'] = idStr;
    _data['created_at'] = createdAt;
    _data['entities'] = entities.toJson();
    _data['extended_entities'] = extendedEntities.toJson();
    return _data;
  }
}

class Entities {
  Entities({
    required this.hashtags,
    required this.symbols,
    required this.userMentions,
    required this.urls,
    required this.media,
  });
  late final List<dynamic> hashtags;
  late final List<dynamic> symbols;
  late final List<dynamic> userMentions;
  late final List<Urls> urls;
  late final List<Media> media;

  Entities.fromJson(Map<String, dynamic> json) {
    hashtags = List.castFrom<dynamic, dynamic>(json['hashtags']);
    symbols = List.castFrom<dynamic, dynamic>(json['symbols']);
    userMentions = List.castFrom<dynamic, dynamic>(json['user_mentions']);
    urls = List.from(json['urls']).map((e) => Urls.fromJson(e)).toList();
    media = List.from(json['media']).map((e) => Media.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['hashtags'] = hashtags;
    _data['symbols'] = symbols;
    _data['user_mentions'] = userMentions;
    _data['urls'] = urls.map((e) => e.toJson()).toList();
    _data['media'] = media.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Urls {
  Urls({
    required this.url,
    required this.expandedUrl,
    required this.displayUrl,
    required this.indices,
  });
  late final String url;
  late final String expandedUrl;
  late final String displayUrl;
  late final List<int> indices;

  Urls.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    expandedUrl = json['expanded_url'];
    displayUrl = json['display_url'];
    indices = List.castFrom<dynamic, int>(json['indices']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['expanded_url'] = expandedUrl;
    _data['display_url'] = displayUrl;
    _data['indices'] = indices;
    return _data;
  }
}

class Media {
  Media({
    required this.id,
    required this.idStr,
    required this.indices,
    required this.mediaUrl,
    required this.mediaUrlHttps,
    required this.url,
    required this.displayUrl,
    required this.expandedUrl,
    required this.type,
    required this.sizes,
  });
  late final int id;
  late final String idStr;
  late final List<int> indices;
  late final String mediaUrl;
  late final String mediaUrlHttps;
  late final String url;
  late final String displayUrl;
  late final String expandedUrl;
  late final String type;
  late final Sizes sizes;

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idStr = json['id_str'];
    indices = List.castFrom<dynamic, int>(json['indices']);
    mediaUrl = json['media_url'];
    mediaUrlHttps = json['media_url_https'];
    url = json['url'];
    displayUrl = json['display_url'];
    expandedUrl = json['expanded_url'];
    type = json['type'];
    sizes = Sizes.fromJson(json['sizes']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['id_str'] = idStr;
    _data['indices'] = indices;
    _data['media_url'] = mediaUrl;
    _data['media_url_https'] = mediaUrlHttps;
    _data['url'] = url;
    _data['display_url'] = displayUrl;
    _data['expanded_url'] = expandedUrl;
    _data['type'] = type;
    _data['sizes'] = sizes.toJson();
    return _data;
  }
}

class Sizes {
  Sizes({
    required this.thumb,
    required this.medium,
    required this.large,
    required this.small,
  });
  late final Thumb thumb;
  late final Medium medium;
  late final Large large;
  late final Small small;

  Sizes.fromJson(Map<String, dynamic> json) {
    thumb = Thumb.fromJson(json['thumb']);
    medium = Medium.fromJson(json['medium']);
    large = Large.fromJson(json['large']);
    small = Small.fromJson(json['small']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['thumb'] = thumb.toJson();
    _data['medium'] = medium.toJson();
    _data['large'] = large.toJson();
    _data['small'] = small.toJson();
    return _data;
  }
}

class Thumb {
  Thumb({
    required this.w,
    required this.h,
    required this.resize,
  });
  late final int w;
  late final int h;
  late final String resize;

  Thumb.fromJson(Map<String, dynamic> json) {
    w = json['w'];
    h = json['h'];
    resize = json['resize'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['w'] = w;
    _data['h'] = h;
    _data['resize'] = resize;
    return _data;
  }
}

class Medium {
  Medium({
    required this.w,
    required this.h,
    required this.resize,
  });
  late final int w;
  late final int h;
  late final String resize;

  Medium.fromJson(Map<String, dynamic> json) {
    w = json['w'];
    h = json['h'];
    resize = json['resize'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['w'] = w;
    _data['h'] = h;
    _data['resize'] = resize;
    return _data;
  }
}

class Large {
  Large({
    required this.w,
    required this.h,
    required this.resize,
  });
  late final int w;
  late final int h;
  late final String resize;

  Large.fromJson(Map<String, dynamic> json) {
    w = json['w'];
    h = json['h'];
    resize = json['resize'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['w'] = w;
    _data['h'] = h;
    _data['resize'] = resize;
    return _data;
  }
}

class Small {
  Small({
    required this.w,
    required this.h,
    required this.resize,
  });
  late final int w;
  late final int h;
  late final String resize;

  Small.fromJson(Map<String, dynamic> json) {
    w = json['w'];
    h = json['h'];
    resize = json['resize'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['w'] = w;
    _data['h'] = h;
    _data['resize'] = resize;
    return _data;
  }
}

class ExtendedEntities {
  ExtendedEntities({
    required this.media,
  });
  late final List<Media> media;

  ExtendedEntities.fromJson(Map<String, dynamic> json) {
    media = List.from(json['media']).map((e) => Media.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['media'] = media.map((e) => e.toJson()).toList();
    return _data;
  }
}
