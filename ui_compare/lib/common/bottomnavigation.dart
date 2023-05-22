import 'common.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return const GNav(gap: 8, backgroundColor: Colors.white, tabs: [
      GButton(
        icon: Icons.home,
        text: "Home",
      ),
      GButton(
        icon: Icons.person_outline,
        text: "Tenz",
      ),
      GButton(icon: Icons.search, text: "Search"),
      GButton(
        icon: Icons.logout,
        text: "Logout",
      )
    ]);
  }
}
