import '../common/common.dart';

class Splash extends StatelessWidget {
  const Splash({
    super.key,
  });
  Future<void> gettimer(BuildContext context) async {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    gettimer(context);

    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assests/images/splash_image.png'),
              const SizedBox(height: 20),
              Text("CompareIt", style: heading),
              const SizedBox(height: 10),
              Text("Compare prices, save money!", style: text),
              const SizedBox(height: 40),
              const CircularProgressIndicator(
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
