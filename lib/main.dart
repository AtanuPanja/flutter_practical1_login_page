import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FocusNode usernameFocusNode;
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    usernameFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
              child: Column(
                children: [
                  Text(
                    'PROMACT',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Focus(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade700,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          labelText: 'Username',
                          hintText:
                              usernameFocusNode.hasFocus ? '' : 'Username',
                          labelStyle: TextStyle(
                            color: usernameFocusNode.hasFocus
                                ? Colors.blue
                                : Colors.grey.shade700,
                          ),
                        ),
                        autofocus: true,
                        focusNode: usernameFocusNode,
                      ),
                      onFocusChange: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      labelText: 'Password',
                      hintText: passwordFocusNode.hasFocus ? '' : 'Password',
                      labelStyle: TextStyle(
                        color: passwordFocusNode.hasFocus
                            ? Colors.blue
                            : Colors.grey.shade700,
                      ),
                    ),
                    focusNode: passwordFocusNode,
                    obscureText: true,
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                    Size(screenWidth / 1.1, 40),
                  ),
                ),
                onPressed: () {},
                child: Text('Login'),
              ),
            ),
            Container(
              height: screenHeight / 1.8,
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                    child: Text('Sign in'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
