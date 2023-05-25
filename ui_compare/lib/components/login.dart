import 'package:ui_compare/common/common.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final CollectionReference compare =
      FirebaseFirestore.instance.collection('users');
  var accountController = TextEditingController();
  var passwordController = TextEditingController();

  final GoogleSignIn googlesignin = GoogleSignIn();
  final auth = FirebaseAuth.instance;
  Future<void> loginbutton() async {
    auth
        .signInWithEmailAndPassword(
            email: accountController.text, password: passwordController.text)
        .then((value) async => {
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
              await getData(),
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

  Future<void> getData() async {
    final QuerySnapshot querySnapshot =
        await compare.where('email', isEqualTo: accountController.text).get();
    if (querySnapshot.size > 0) {
      final userDoc = querySnapshot.docs.first;
      final userData = userDoc.data() as Map<String, dynamic>;
      final email = userData['email'];
      final orders = userData['orders'];
      final userDataProvider = Provider.of<UserDetails>(context, listen: false);
      userDataProvider.setUserData(accountController.text, orders);
    }
  }

  Future<void> getData12(String email) async {
    print("Email: $email");
    final QuerySnapshot querySnapshot =
        await compare.where('email', isEqualTo: email).get();
    if (querySnapshot.size > 0) {
      final userDoc = querySnapshot.docs.first;
      final userData = userDoc.data() as Map<String, dynamic>;
      final email = userData['email'];
      final orders = userData['orders'];
      final userDataProvider = Provider.of<UserDetails>(context, listen: false);
      userDataProvider.setUserData(email, orders);
    }
  }

  Future<void> registerbutton() async {
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
              compare
                  .add({"email": accountController.text, "orders": []})
                  .then((value) => print("Database"))
                  .catchError((e) => print(e)),
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

  Future<void> signin() async {
    googlesignin
        .signIn()
        .then((value) async => {
              if (value != null)
                {
                  Provider.of<UserProvider>(context, listen: false)
                      .setUserData(value.email, value.displayName ?? ""),
                  await google_check(value.email),
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    text: "User Authenticated",
                  ),
                  Future.delayed(const Duration(seconds: 5), () {
                    Navigator.pushNamed(context, '/landing');
                  })
                }
            })
        .catchError((e) => {print(e)});
  }

  Future<void> google_check(String email) async {
    final QuerySnapshot querySnapshot =
        await compare.where('email', isEqualTo: email).get();
    if (querySnapshot.size > 0) {
      final DocumentSnapshot userDoc = querySnapshot.docs.first;
      final userData = userDoc.data() as Map<String, dynamic>;
      final fetchedEmail = userData['email'];
      final orders = userData['orders'];
    } else {
      await compare.add({"email": email, "orders": []});

      print('User added to Firestore');
    }
    await getData12(email);
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
        body: Consumer<UserDetails>(builder: (context, data, child) {
      return Container(
        width: double.infinity,
        color: const Color(0xFF5d69b3),
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
                          const TextDesign(
                            text: "Login",
                            size: 40,
                            bold: "y",
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
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 70,
                                        right: 70)),
                                onPressed: () {
                                  if (accountController.text.isEmpty) {
                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.error,
                                      title: 'Error',
                                      text: 'Please enter an account email.',
                                      autoCloseDuration:
                                          const Duration(seconds: 5),
                                    );
                                  } else if (passwordController.text.length <=
                                      6) {
                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.error,
                                      title: 'Error',
                                      text:
                                          'Password should be at least 6 characters long.',
                                      autoCloseDuration:
                                          const Duration(seconds: 5),
                                    );
                                  } else {
                                    loginbutton();
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: TextDesign(
                                    text: "Login",
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: width * 0.8,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
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
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: TextDesign(
                                    text: "Register",
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const TextDesign(text: "OR", size: 25),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: width * 0.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
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
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assests/images/google.png', // Replace with your own Google logo asset
                                      height: 25,
                                    ),
                                    const SizedBox(width: 20),
                                    const TextDesign(
                                      text: "Sign in with Google",
                                      size: 25,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
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
      );
    }));
  }
}
