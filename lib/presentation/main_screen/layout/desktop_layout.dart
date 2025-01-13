import 'package:app/presentation/main_screen/layout/_drawer.dart';
import 'package:app/resource/utils/common_lib.dart';
import 'package:app/resource/utils/extensions.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          context.theme.isDark ? context.theme.kWhite : context.theme.kBlack,
      
      body: Row(
        children: [
          // Drawer
          const CustomDrawer(),
          // Child
          Expanded(child: child),
        ],
      ),
    );
  }
}
