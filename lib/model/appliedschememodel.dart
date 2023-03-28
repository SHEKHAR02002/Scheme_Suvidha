class ApplySchmeDetail {
  String? applicationid;
  String? userid;
  String? disabilitytype;
  String? schmename;
  // String? applydate;
  bool? verification;
  String? aadharno;
  String? name;

  ApplySchmeDetail(
      {required this.aadharno,
      required this.applicationid,
      // required this.applydate,
      required this.disabilitytype,
      required this.name,
      required this.schmename,
      required this.userid,
      required this.verification});

  ApplySchmeDetail.fromMap(Map<String, dynamic> map) {
    aadharno = map['aadharno'];
    applicationid = map['Applicationid'];
    // applydate = map['dataofapply'];
    disabilitytype = map['disabilitytype'];
    name = map['name'];
    schmename = map['schemename'];
    userid = map['userId'];
    verification = map['verification'];
  }
}
