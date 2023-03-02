import 'package:flutter/foundation.dart';

class SchemeModel {
  // String? schemeid;
  String? agegroup;
  String? annualicome;
  String? benefits;
  String? category;
  String? disabilitypercentage;
  String? disabilitytype;
  String? nationality;
  String? organizationname;
  String? schemename;
  String? shortdescription;
  String? statename;
  String? supportingdocuments;
  String? websitelink;

  SchemeModel(
      // this.schemeid,
      this.agegroup,
      this.annualicome,
      this.benefits,
      this.category,
      this.disabilitypercentage,
      this.disabilitytype,
      this.nationality,
      this.organizationname,
      this.schemename,
      this.shortdescription,
      this.statename,
      this.supportingdocuments,
      this.websitelink);

   Map<String, dynamic> toMap() {
    return {
      // "schemeid": schemeid,
      "ageGroup": agegroup,
      "annualIncome": annualicome,
      "benefits": benefits,
      "category": category,
      "disabilityPercentage": disabilitypercentage,
      "disabilityType": disabilitytype,
      "nationality": nationality,
      "organizationName": organizationname,
      "schemeName": schemename,
      "shortDescription": shortdescription,
      "stateName": statename,
      "supportingDocuments": supportingdocuments,
      "websiteLink": websitelink,

    };
  }

  SchemeModel.fromSnapshot(snapshot)
     : agegroup = snapshot.data()['ageGroup'],
      annualicome = snapshot.data()['annualIncome'],
      benefits = snapshot.data()['benefits'], 
      category = snapshot.data()['category'], 
      disabilitypercentage = snapshot.data()['disabilityPercentage '], 
      disabilitytype = snapshot.data()['disabilityType'], 
      nationality = snapshot.data()['nationality'],
      organizationname = snapshot.data()['organizationName '],
      schemename = snapshot.data()['schemeName'],
      shortdescription = snapshot.data()['shortDescription '],
      statename = snapshot.data()['stateName'],
      supportingdocuments = snapshot.data()['supportingDocuments'],
      websitelink = snapshot.data()['websiteLink'];
      

  SchemeModel.fromMap(map) 
    :
      // schemeid = map['schemeid'];
      agegroup = map["ageGroup"],
      annualicome = map["annualIncome"],
      benefits = map["benefits"],
      category = map["category"],
      disabilitypercentage = map["disabilityPercentage"],
      disabilitytype = map["disabilityType"],
      nationality = map["nationality"],
      organizationname = map["organizationName"],
      schemename = map["schemeName"],
      shortdescription = map["shortDescription"],
      statename = map["stateName"],
      supportingdocuments = map["supportingDocuments"],
      websitelink = map["websiteLink"];
     
   
  

 
}
