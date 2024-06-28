// ignore_for_file: non_constant_identifier_names

class CardData {
  String? cardImage;
  String? businessName;
  String? businessField;
  String? businessBio;
  String? website;
  String? businessEmail;
  String? businessPhone;
  bool? isPublic;
  bool? isSelected;
  String? country;
  String? city;
  String? organization;
  String? time;
  String? lat;
  String? long;
  String? color;
  String? qrCodeUrl;
  String? maxScale;
  String? startScale;

  CardData({
    this.cardImage,
    this.businessName,
    this.businessField,
    this.businessBio,
    this.website,
    this.businessEmail,
    this.businessPhone,
    this.isPublic,
    this.isSelected,
    this.country,
    this.city,
    this.organization,
    this.time,
    this.lat,
    this.long,
    this.color,
    this.qrCodeUrl,
    this.maxScale,
    this.startScale,
  });

  // Convert CardData object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'cardImage': cardImage,
      'businessName': businessName,
      'businessField': businessField,
      'businessBio': businessBio,
      'website': website,
      'businessEmail': businessEmail,
      'businessPhone': businessPhone,
      'isPublic': isPublic,
      'isSelected': isSelected,
      'country': country,
      'city': city,
      'organization': organization,
      'time': time,
      'lat': lat,
      'long': long,
      'color': color,
      'qeCodeUrl': qrCodeUrl,
      'maxScale': maxScale,
      'startScale': startScale,
    };
  }

  // Create CardData object from JSON map
  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      cardImage: json['cardImage'],
      businessName: json['businessName'],
      businessField: json['businessField'],
      businessBio: json['businessBio'],
      website: json['website'],
      businessEmail: json['businessEmail'],
      businessPhone: json['businessPhone'],
      isPublic: json['isPublic'],
      isSelected: json['isSelected'],
      country: json['country'],
      city: json['city'],
      organization: json['organization'],
      time: json['time'],
      lat: json['lat'],
      long: json['long'],
      color: json['color'],
      qrCodeUrl: json['qeCodeUrl'],
      maxScale: json['maxScale'],
      startScale: json['startScale'],
    );
  }
}
