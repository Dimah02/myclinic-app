import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myclinic/data/auth/login_service.dart';
import 'package:myclinic/utils/constants/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool _isPasswordVisible = false, _isPasswordVisible2 = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  void _register() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          loading = true;
        });
        await AuthenticationServices().userSignup(
            name: "${_firstNameController.text} ${_lastNameController.text}",
            password: _passwordController.text,
            email: _emailController.text);
        setState(() {
          loading = false;
        });
        Navigator.pushNamed(context, "/signup2");
      } catch (e) {
        setState(() {
          loading = false;
        });
        _showToast(e.toString());
      }
    }
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
          Text(
            message,
            style: const TextStyle(color: Colors.white),
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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: (loading == false)
            ? _form()
            : const Center(
                child: CircularProgressIndicator(
                  color: KColors.primary,
                ),
              ),
      ),
    );
  }

  Form _form() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create Your Account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    expands: false,
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      labelText: "First Name*",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "First name is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      labelText: "Last Name*",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Last name is required";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Email
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email*",
                hintText: "202XXXXX@students.asu.edu.jo",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                }
                if (!RegExp(r"^[^@]+@[^@]+\.[^@]+").hasMatch(value)) {
                  return "Enter a valid email";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Password
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "Password*",
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: KColors.bestGrey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              obscureText: !_isPasswordVisible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                }
                if (value.length < 4) {
                  return "Password must be at least 4 characters";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Confirm Password
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: "Confirm Password*",
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible2
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: KColors.bestGrey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible2 = !_isPasswordVisible2;
                    });
                  },
                ),
                border: const OutlineInputBorder(),
              ),
              obscureText: !_isPasswordVisible2,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Confirm Password is required";
                }
                if (value != _passwordController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 32,
            ),
            // Register Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _register,
                child: const Text(
                  "Continue",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
