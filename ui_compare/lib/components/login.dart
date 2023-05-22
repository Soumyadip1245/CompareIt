import 'package:ui_compare/common/common.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var accountController = TextEditingController();
  var passwordController = TextEditingController();

  final GoogleSignIn googlesignin = GoogleSignIn();
  final auth = FirebaseAuth.instance;
  Future<void> loginbutton() async {
    auth
        .signInWithEmailAndPassword(
            email: accountController.text, password: passwordController.text)
        .then((value) => {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: "User Authenticated",
              ),
              Future.delayed(const Duration(seconds: 5), () {
                Navigator.pushNamed(context, '/landing');
              }),
              Provider.of<UserProvider>(context, listen: false).setUserData(
                  accountController.text, accountController.text.split('@')[0]),
              clear(),
            })
        .catchError((e) => {
              QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  title: 'Oops...',
                  text: 'User Not Found In Our Database',
                  autoCloseDuration: const Duration(seconds: 5)),
              clear()
            });
  }

  Future<void> registerbutton() async {
    print("Hello");
    auth
        .createUserWithEmailAndPassword(
            email: accountController.text, password: passwordController.text)
        .then((value) => {
              QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  text: 'Registration Successful',
                  showCancelBtn: false,
                  autoCloseDuration: const Duration(seconds: 5)),
              clear()
            })
        .catchError((e) => {
              QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  title: 'Oops...',
                  text: 'User Cannot Be Registered',
                  showCancelBtn: false,
                  autoCloseDuration: const Duration(seconds: 5)),
              clear()
            });
  }

  void signin() {
    googlesignin
        .signIn()
        .then((value) => {
              if (value != null)
                {
                  Provider.of<UserProvider>(context, listen: false)
                      .setUserData(value.email, value.displayName ?? ""),
                  Future.delayed(const Duration(seconds: 5), () {
                    Navigator.pushNamed(context, '/landing');
                  })
                }
            })
        .catchError((e) => {print(e)});
  }

  void clear() {
    accountController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color(0xFF9AA0FC),
        height: height,
        child: Container(
          child: Column(
            children: [
              Image.asset(
                "assests/images/login.png",
                height: 250,
                fit: BoxFit.contain,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          TextDesign(text: "Login", size: 25),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 1,
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextInput(
                            text: "Account Email",
                            icon: Icons.people,
                            controller: accountController,
                          ),
                          TextInput(
                            text: "Account Password",
                            icon: Icons.key,
                            controller: passwordController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: width * 0.8,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 70,
                                        right: 70)),
                                onPressed: () {
                                  if (accountController.text.isNotEmpty &&
                                      passwordController.text.length > 6) {
                                    loginbutton();
                                  }
                                },
                                child: TextDesign(
                                  text: "Login",
                                  size: 20,
                                  color: Colors.white,
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: width * 0.8,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 70,
                                        right: 70)),
                                onPressed: () {
                                  if (accountController.text.isNotEmpty &&
                                      passwordController.text.length > 6) {
                                    registerbutton();
                                  }
                                },
                                child: TextDesign(
                                  text: "Register",
                                  size: 20,
                                  color: Colors.white,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextDesign(text: "OR", size: 28),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: width * 0.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 70, right: 70),
                                backgroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              onPressed: () {
                                signin();
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assests/images/google.png', // Replace with your own Google logo asset
                                    height: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Sign in with Google',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
