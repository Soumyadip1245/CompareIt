import 'common.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return GNav(gap: 8, backgroundColor: Colors.white, tabs: [
      GButton(
        icon: Icons.home,
        text: "Home",
        onPressed: () {
          Navigator.pushNamed(context, '/landing');
        },
      ),
      GButton(
        icon: Icons.payment,
        text: "Payment",
        onPressed: () {
          Navigator.pushNamed(context, '/payment');
        },
      ),
      GButton(
        icon: Icons.local_grocery_store,
        text: "Shop",
        onPressed: () {
          Navigator.pushNamed(context, '/shop');
        },
      ),
      GButton(
        icon: Icons.logout,
        text: "Logout",
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
      )
    ]);
  }
}
