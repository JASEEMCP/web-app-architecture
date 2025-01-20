

import 'package:app/presentation/main_screen/main_screen.dart';
import 'package:app/resource/utils/common_lib.dart';
import 'package:app/resource/utils/debouncer.dart';
import 'package:app/resource/utils/extensions.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      backgroundColor: context.theme.kWhite,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        child: Builder(builder: (context) {
          return ValueListenableBuilder(
            valueListenable: tabChangeNotifier,
            builder: (context, index, _) {
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        !ResponsiveLayout.isDesktop(context)
                            ? const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Image.asset(
                                  //   ImagePath.,
                                  //   height: 55,
                                  // ),
                                ],
                              )
                            : const SizedBox.shrink(),

                        /// Menu
                        Text(
                          'MENU'.toTitleCase(),
                          style: $style.text.textBold12.copyWith(
                            color: context.theme.kBlack,
                          ),
                        ),
                        TileWidget(
                          tileName: 'Dashboard',
                          isSelected: index == 0,
                          icon: Icons.home_outlined,
                          onTap: () {
                            tabChangeNotifier.value = 0;
                          },
                        ),

                        TileWidget(
                          isSelected: index == 1,
                          tileName: 'Inbox',
                          icon: Icons.inbox_rounded,
                          onTap: () {
                            tabChangeNotifier.value = 1;
                          },
                        ),
                        const Gap(5),

                        /// Recruitment
                        // Text(
                        //   'RECRUITMENT',
                        //   style: $style.text.textBold14.copyWith(
                        //     color: context.theme.shareinfoBlue,
                        //   ),
                        // ),
                        // TileWidget(
                        //   isSelected: index == 2,
                        //   tileName: 'New Drive',
                        //   icon: Icons.add,
                        //   onTap: () {
                        //     tabChangeNotifier.value = 2;
                        //     context.go(ScreenPath.createDrive);
                        //   },
                        // ),
                        // TileWidget(
                        //   isSelected: index == 3,
                        //   tileName: 'All Drives',
                        //   icon: Icons.all_inbox,
                        //   onTap: () {
                        //     tabChangeNotifier.value = 3;

                        //     context.go(ScreenPath.allDrive);
                        //   },
                        // ),
                        // TileWidget(
                        //   isSelected: index == 4,
                        //   tileName: 'Trainings',
                        //   icon: Icons.person_outline,
                        //   onTap: () {
                        //     tabChangeNotifier.value = 4;
                        //   },
                        // ),

                        /// Organization
                        Text(
                          'ORGANIZATION'.toTitleCase(),
                          style: $style.text.textBold12.copyWith(
                            color: context.theme.kBlack,
                          ),
                        ),
                        const Gap(5),
                        TileWidget(
                          isSelected: index == 5,
                          tileName: 'Verify Students',
                          icon: Icons.verified,
                          onTap: () {
                            tabChangeNotifier.value = 5;
                          },
                        ),
                        TileWidget(
                          isSelected: index == 6,
                          tileName: 'Students',
                          icon: Icons.group,
                          onTap: () {
                            tabChangeNotifier.value = 6;
                          },
                        ),
                        TileWidget(
                          isSelected: index == 7,
                          tileName: 'Report',
                          icon: Icons.report_outlined,
                          onTap: () {
                            tabChangeNotifier.value = 7;
                          },
                        ),
                        TileWidget(
                          isSelected: index == 8,
                          tileName: 'Settings',
                          icon: Icons.settings_outlined,
                          onTap: () {
                            tabChangeNotifier.value = 8;
                          },
                        ),
                      ],
                    ),
                  ),
                  Gap($style.insets.sm),
                  TileWidget(
                    isSelected: true,
                    bgColor: context.theme.kWhite.withOpacity(0.3),
                    textColor: context.theme.kBlack,
                    tileName: 'Logout',
                    icon: Icons.exit_to_app,
                    onTap: () {
                      
                    },
                  ),
                ],
              );
            },
          );
        }),
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  TileWidget({
    super.key,
    required this.tileName,
    required this.onTap,
    required this.icon,
    this.isSelected,
    this.bgColor,
    this.textColor,
  });
  final String tileName;
  final Function onTap;
  final IconData icon;
  final bool? isSelected;
  final Color? bgColor;
  final Color? textColor;
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 100));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ListTile(
        dense: true,
        selectedTileColor:
            bgColor ?? context.theme.kWhite.withOpacity(0.2),
        hoverColor: context.theme.kWhite.withOpacity(0.1),
        splashColor: context.theme.kWhite.withOpacity(0.1),
        enableFeedback: false,
        selected: isSelected ?? false,
        onTap: () {
          _debouncer.call(
            () {
              onTap();
            },
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        leading: Icon(
          icon,
          color: isSelected ?? false
              ? textColor ?? context.theme.kBlack
              : textColor ?? context.theme.kBlack,
          size: 18,
        ),
        title: Text(
          tileName,
          style: isSelected ?? false
              ? $style.text.textBold12.copyWith(
                  color: textColor ?? context.theme.kBlack,
                )
              : $style.text.textSBold12.copyWith(
                  color: textColor ?? context.theme.kBlack,
                ),
        ),
      ),
    );
  }
}
