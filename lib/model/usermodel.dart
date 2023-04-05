class UserModel {
  String? userId;
  String? image;
  String? applicationid;

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

  String? applyschemename;
  // DateTime? applydate;

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
      required this.verification,
      required this.image,
      required this.applyschemename,
      required this.applicationid
      // required this.applydate,
      });

  UserModel.fromMap(Map<String, dynamic> map) {
    userId = map['userId'];
    applicationid = map['Applicationid'];

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

    image = map['image'];

    applyschemename = map['schemeName'];
    // applydate = map['dataofapply'].toDate();
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      "Applicationid": applicationid,
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
      'image': image,
      'schemename': applyschemename,
      // 'dataofapply':applydate
    };
  }
}

class AgentModel {
  String? uid,
      name,
      gender,
      dob,
      occupation,
      address,
      pincode,
      emailid,
      password;
  bool verification = false;

  AgentModel(
      {required this.address,
      required this.verification,
      required this.dob,
      required this.uid,
      required this.emailid,
      required this.gender,
      required this.name,
      required this.occupation,
      required this.password,
      required this.pincode});

  AgentModel.fromMap(Map<String, dynamic> map) {
    name = map["name"];
    dob = map["dob"];
    emailid = map["email"];
    password = map["password"];
    verification = map["verification"];
    uid = map["userId"];
    address = map["address"];
    occupation = map["occupation"];
    pincode = map["pincode"];
  }
  Map<String, dynamic> toMap() => {
        "name": name,
        "dob": dob,
        "email": emailid,
        "password": password,
        "verification": verification,
        "uid": uid,
        "address": address,
        "pincode": pincode,
        "occupation": occupation,
      };
}
