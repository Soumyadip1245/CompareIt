import 'common/common.dart';
import 'components/login.dart';
import 'components/splash.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      title: "CompareIt",
      debugShowCheckedModeBanner: false,
      routes: {'/login': (context) => const Login()},
      theme: ThemeData(primarySwatch: Colors.purple),
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
