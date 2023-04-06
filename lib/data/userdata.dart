import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:scheme/model/usermodel.dart';

String fcmToken = "";
String? aadharNo, dob, gender, name, phoneNo, aadharimage;
String? udidNo,
    udidname,
    disbilitytype,
    disabilitypercentage,
    dataissue,
    validupto,
    udidimage,
    passportimage;
String screenSate = "Home";
bool registration = false, verificationstatus = false, isagent = false;
AgentModel? agentDetails;
UserModel? userDetail;
String defaultPic =
    "https://firebasestorage.googleapis.com/v0/b/scheme-suvidha-admin.appspot.com/o/miscellaneous%2Fdefalutprofile.png?alt=media&token=fbf2357d-d893-43a7-9bcc-412f454691c4";
final customCacheManager = CacheManager(Config('customCacheManager',
    stalePeriod: const Duration(minutes: 2), maxNrOfCacheObjects: 100));

String organizationpic =
    "https://firebasestorage.googleapis.com/v0/b/scheme-suvidha-admin.appspot.com/o/miscellaneous%2Fgovt_of_ind_logo.png?alt=media&token=5f0e0211-e6c0-4f02-bfc2-338b65a9c694";

String? agentimage,
    agentname,
    agentgender,
    agentdob,
    agentoccupation,
    agentaddress,
    agentpincode,
    agentphonenumber,
    agentemailid,
    agentpassword;

String? agentbyimage,
    agentbyaadharimage,
    agentbyudidimage,
    agentaadharNo,
    agentbydob,
    agentbygender,
    agentbyname,
    agentbyphoneNo,
    agentbyudidNo,
    agentbyudidname,
    agentbydisbilitytype,
    agentbydisabilitypercentage,
    agentbydataissue,
    agentbyvalidupto;

String? addressprooflink,
    addresproftype,
    ageprooftype,
    ageprooflink,
    domacilelink,
    incomecertilink,
    lastyearlink,
    parentidlink;
