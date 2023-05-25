import 'common/common.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<CartState>(create: (context) => CartState()),
        ChangeNotifierProvider<UserDetails>(create: (context) => UserDetails()),
        ChangeNotifierProvider<CompareState>(
            create: (context) => CompareState()),
      ],
      child: MaterialApp(
        home: const MyApp(),
        title: "CompareIt",
        debugShowCheckedModeBanner: false,
        routes: {
          '/login': (context) => const Login(),
          '/landing': (context) => const Landing(),
          '/compare': (context) => const Compare(),
          '/shop': (context) => const Shop(),
          '/order': (context) => const Order(),
          '/payment': (context) => const Payment(),
          '/cart': (context) => const Cart(),
          '/product': (context) => Product(),
          '/payment': (context) => const Payment(),
        },
        theme: ThemeData(
          primarySwatch: const MaterialColor(0xFF5d69b3, <int, Color>{
            50: Color(0xFFECEFF1),
            100: Color(0xFFC5CAE9),
            200: Color(0xFF9AA0FC),
            300: Color(0xFF6F76F0),
            400: Color(0xFF444CE4),
            500: Color(0xFF1A21D8),
            600: Color(0xFF171DC2),
            700: Color(0xFF1318AC),
            800: Color(0xFF0F1496),
            900: Color(0xFF0B107F),
          }),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Splash(),
    );
  }
}
