class UserModel {
  String? userId;

  String? aadharno;
  String? name;
  String? dob;
  String? gender;
  String? phoneno;

  String? udidno;
  String? udidname;
  String? disabilitytype;
  String? disabilitypercentage;
  String? dateissue;
  String? validupto;

  String? aadharimage;
  String? udidimage;

  bool? registeration;
  bool? verification;

  bool? pushpermission;
  bool? emailpermission;
  bool? schmerenewal;
  bool? newschemalert;
  bool? newcampalert;

  UserModel(
      {required this.aadharimage,
      required this.aadharno,
      required this.dateissue,
      required this.disabilitypercentage,
      required this.disabilitytype,
      required this.dob,
      required this.gender,
      required this.name,
      required this.newcampalert,
      required this.newschemalert,
      required this.phoneno,
      required this.pushpermission,
      required this.registeration,
      required this.schmerenewal,
      required this.udidimage,
      required this.udidname,
      required this.udidno,
      required this.userId,
      required this.validupto,
      required this.verification});

  UserModel.fromMap(Map<String, dynamic> map) {
    userId = map['userId'];

    aadharimage = map['aadharimage'];
    aadharno = map['aadharno'];
    name = map['name'];
    dob = map['dob'];
    gender = map['gender'];
    phoneno = map['phoneno'];

    udidimage = map['udidimage'];
    udidno = map['udidno'];
    udidname = map['udidname'];
    disabilitytype = map['disabilitytype'];
    disabilitypercentage = map['disabilitypercentage'];
    dateissue = map['dateissue'];
    validupto = map['validupto'];

    registeration = map['registeration'];
    verification = map['verification'];

    pushpermission = map['pushpermission'];
    emailpermission = map['emailpermission'];
    schmerenewal = map['schmerenewal'];
    newschemalert = map['newschemalert'];
    newcampalert = map['newcampalert'];
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'aadharimage': aadharimage,
      'aadharno': aadharno,
      'name': name,
      'dob': dob,
      'gender': gender,
      'phoneno': phoneno,
      'udidimage': udidimage,
      'udidno': udidno,
      'udidname': udidname,
      'disabilitytype': disabilitytype,
      'disabilitypercentage': disabilitypercentage,
      'dateissue': dateissue,
      'validupto': validupto,
      'registeration': registeration,
      'verification': verification,
      'pushpermission': pushpermission,
      'emailpermission': emailpermission,
      'schmerenewal': schmerenewal,
      'newschemalert': newschemalert,
      'newcampalert': newcampalert,
    };
  }
}
