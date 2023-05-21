import 'package:ui_compare/common/common.dart';

import '../common/textfield.dart';

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

  void loginbutton() {
    String accountEmail = accountController.text.toString();
    String accountPassword = passwordController.text.toString();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.purple,
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
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
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
                          Text(
                            "Login",
                            style: textheading,
                          ),
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
                                  loginbutton();
                                },
                                child: Text(
                                  "Login",
                                  style: buttontext,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "OR",
                            style: textheading,
                          ),
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
                              onPressed: () {},
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
