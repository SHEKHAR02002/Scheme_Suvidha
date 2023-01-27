import 'package:flutter_cache_manager/flutter_cache_manager.dart';

String aadharImage = "", fcmToken = "";
String aadharNo = "", dob = "", gender = "", name = "", phoneNo = "";

final customCacheManager = CacheManager(Config('customCacheManager',
    stalePeriod: const Duration(minutes: 2), maxNrOfCacheObjects: 100));
