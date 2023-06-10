class HATEOASLink {
  final String rel;
  final Uri href;
  final String type;

  HATEOASLink({
    required this.rel,
    required this.href,
    this.type = 'application/json',
  });

  factory HATEOASLink.fromJson(Map<String, dynamic> json) {
    return HATEOASLink(
      rel: json['rel'],
      href: Uri.parse(json['href']),
      type: json['type'] ?? 'application/json',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rel': rel,
      'href': href.toString(),
      'type': type,
    };
  }

  static List<HATEOASLink> fromJsonList(List<dynamic> jsonList) {
    List<HATEOASLink> links = [];
    for (var link in jsonList) {
      links.add(HATEOASLink.fromJson(link));
    }
    return links;
  }

}
