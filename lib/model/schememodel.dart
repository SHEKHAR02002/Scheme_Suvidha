import 'package:flutter/foundation.dart';

class SchemeModel {
  String? schemeid;
  String? name;
  String? organization;
  String? description;
  String? benifits;
  String? eligibilty;
  String? image;
  String? more;
  String? requirement1;
  String? requirement2;
  String? requirement3;

  SchemeModel(
      this.schemeid,
      this.name,
      this.benifits,
      this.description,
      this.eligibilty,
      this.image,
      this.more,
      this.organization,
      this.requirement1,
      this.requirement2,
      this.requirement3);

  SchemeModel.fromMap(map) {
    try {
      schemeid = map['schemeid'];
      name = map["name"];
      benifits = map["benifits"];
      description = map["description"];
      eligibilty = map["eligibilty"];
      image = map["image"];
      more = map["more"];
      organization = map["organization"];
      requirement1 = map["requirement1"];
      requirement2 = map["requirement2"];
      requirement3 = map["requirement3"];
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Map<String, dynamic> toMap() {
    return {
      "schemeid": schemeid,
      "name": name,
      "benifits": benifits,
      "description": description,
      "eligibilty": eligibilty,
      "image": image,
      "more": more,
      "organization": organization,
      "requirement1": requirement1,
      "requirement2": requirement2,
      "requirement3": requirement3
    };
  }
}
