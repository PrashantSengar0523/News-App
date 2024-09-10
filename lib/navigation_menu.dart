import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nexus_news/screens/bookmark.dart';
import 'package:nexus_news/screens/discover.dart';
import 'package:nexus_news/screens/home.dart';
import 'package:nexus_news/screens/profile.dart';
import 'package:nexus_news/utils/constants/colors.dart';
import 'package:nexus_news/utils/constants/responsive.dart';
import 'package:provider/provider.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Consumer<NavigationProvider>(
        builder: (context, navigationProvider, _) {
          return Scaffold(
            backgroundColor: TColors.white,
            bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                indicatorColor: TColors.white, 
                labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.selected)) {
                      return const TextStyle(color: TColors.primary); 
                    }
                    return const TextStyle(color: TColors.darkGrey);
                  },
                ),
                iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.selected)) {
                      return const IconThemeData(color: TColors.primary); 
                    }
                    return const IconThemeData(color: TColors.darkGrey); 
                  },
                ),
              ),
              child: NavigationBar(
                height: Responsive.getWidth(context)>=600?90:55,
                backgroundColor: TColors.white, 
                selectedIndex: navigationProvider.selectedIndex,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                onDestinationSelected: (int index) {
                  navigationProvider.setIndex(index); 
                },
                destinations: [
                  NavigationDestination(icon: Icon(Iconsax.home,size: Responsive.getWidth(context)>=600? 36:18), label: 'Home'),
                  NavigationDestination(icon: Icon(Iconsax.discover_1,size: Responsive.getWidth(context)>=600? 36:18), label: 'Discover'),
                  NavigationDestination(icon: Icon(Iconsax.bookmark,size: Responsive.getWidth(context)>=600? 36:18), label: 'Bookmarks'),
                  NavigationDestination(icon: Icon(Iconsax.user,size: Responsive.getWidth(context)>=600? 36:18), label: 'Profile')
                ],
                elevation: 8,
              ),
            ),
            body: navigationProvider.screens[navigationProvider.selectedIndex],
          );
        },
      ),
    );
  }
}

class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    if (index != _selectedIndex) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  final List<Widget> screens = [
    const Home(),
    const Discover(),
    const Bookmark(),
    const Profile(),
  ];
}
