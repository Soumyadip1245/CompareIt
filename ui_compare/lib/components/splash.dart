import '../common/common.dart';

class Splash extends StatelessWidget {
  const Splash({
    super.key,
  });
  Future<void> gettimer(BuildContext context) async {
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    gettimer(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          color: const Color(0xFFFFFFFF),
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assests/images/splash.gif',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 40,
              ),
              const TextDesign(
                text: "CompareIt",
                size: 40,
                bold: "y",
              ),
              const SizedBox(height: 10),
              const TextDesign(
                  text: "Compare prices, save money!",
                  size: 20,
                  color: Colors.grey),
              const SizedBox(height: 40),
              const CircularProgressIndicator(
                color: Colors.purple,
              ),
              const SizedBox(height: 40),
              TextDesign(
                text: "Powered by Soumyadip Das",
                size: 15,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
