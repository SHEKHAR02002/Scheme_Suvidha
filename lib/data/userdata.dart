import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:scheme/model/usermodel.dart';

String aadharImage = "", fcmToken = "";
String? aadharNo, dob, gender, name, phoneNo, aadharimage;
String? udidNo,
    udidname,
    disbilitytype,
    disabilitypercentage,
    dataissue,
    validupto,
    udidimage;

UserModel? userDetail;

final customCacheManager = CacheManager(Config('customCacheManager',
    stalePeriod: const Duration(minutes: 2), maxNrOfCacheObjects: 100));
