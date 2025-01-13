import 'package:injectable/injectable.dart';
import 'package:app/main.dart';
import 'package:app/router/router_path.dart';



@lazySingleton
class AppLogic {
  ///This used for redirecting
  bool isBootStrapComplete = false;

  Future<void> bootstrap() async {
    try {
      //FlutterSecureStorage().deleteAll();
      /// Initializing db
      await pref.load();

      /// Initializing token state
      //await tokenCubit.initTokenState();

      ///Flagging bootstrap
      isBootStrapComplete = true;
      
 
      appRouter.go(ScreenPath.splash);
      
    } catch (e) {
      //appRouter.go(ScreenPath.login);
    }
  }
}
