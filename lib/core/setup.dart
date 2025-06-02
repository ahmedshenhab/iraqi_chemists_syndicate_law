
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iraqi_chemists_syndicate_law/core/di/di.dart';
import 'package:iraqi_chemists_syndicate_law/core/observer/observer.dart';
import 'package:iraqi_chemists_syndicate_law/core/services/shared_prefrence/cach_helper.dart';

Future<void> setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kDebugMode){
    
     
  Bloc.observer = MyBlocObserver();

  }
  // HydratedBloc.storage = await HydratedStorage.build(
  //   storageDirectory: HydratedStorageDirectory(
  //     (await getTemporaryDirectory()).path,
  //   ),
  // );
  

  await Future.wait([
    CachHelper.init,
    ScreenUtil.ensureScreenSize(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
     
    ]),
     

    
  ]);

  setupGetIt();
}

// String get getIntialRoute {
//   final token = CachHelper.getData(key: AppConstant.tokenKey);
//   if (token != null && token.isNotEmpty) {
//     return MealLayoutScreen.homeScreen;
//   } else {
//     return MealLoginScreen.loginScreen;
//   }
// }
