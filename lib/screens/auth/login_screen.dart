import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myclinic/data/auth/login_service.dart';
import 'package:myclinic/utils/constants/colors.dart';
import 'package:myclinic/utils/helpers/validation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool loading = false;

  void _login() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          loading = true;
        });
        await AuthenticationServices().login(
            password: _passwordController.text, email: _emailController.text);

        loading = false;
        if (context.mounted) {
          Navigator.pushNamed(context, "/navigationmenu");
        }
      } catch (e) {
        setState(() {
          loading = false;
        });
        _showToast(e.toString());
      }
    }
  }

  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  _showToast(String message) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.info, color: Colors.white),
          const SizedBox(
            width: 12.0,
          ),
          Row(
            children: [
              Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: (loading == false)
          ? BottomAppBar(
              color: Colors.white,
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You do not have an account?"),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/signup");
                    },
                    child: const Text(
                      "Signup",
                      style: TextStyle(color: KColors.primary),
                    ),
                  )
                ],
              ),
            )
          : null,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24 * 3),
        child: (loading == false)
            ? SingleChildScrollView(
                child: _form(context),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: KColors.primary,
                ),
              ),
      ),
    );
  }

  Form _form(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/images/logoruba.png",
              //width: MediaQuery.of(context).size.width * 0.35,
            ),
          ),
          const Text(
            "Log into account",
            style: TextStyle(
                fontSize: 24,
                color: KColors.black,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 32),
          TextFormField(
            validator: (value) => KValidator.validateEmail(value),
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: "University Email",
              hintText: "202XXXXX@students.asu.edu.jo",
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            validator: (value) =>
                KValidator.validateEmptyText("password", value),
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: "Password",
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: KColors.bestGrey,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _login,
              child: const Text(
                "Log in",
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Row(
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => ResetPasswordPage(),
          //           ),
          //         );
          //       },
          //       child: const Text(
          //         "Forgot password?",
          //         style: TextStyle(
          //           color: KColors.primary,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
