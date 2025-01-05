import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myclinic/data/auth/login_service.dart';
import 'package:myclinic/utils/constants/colors.dart';
import 'package:myclinic/utils/helpers/validation.dart';

class SignupSecondScreen extends StatefulWidget {
  const SignupSecondScreen({
    super.key,
  });

  @override
  SignupSecondScreenState createState() => SignupSecondScreenState();
}

class SignupSecondScreenState extends State<SignupSecondScreen> {
  // Controllers

  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _bloodTypeController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _allergyController = TextEditingController();
  final TextEditingController _midicalHistory = TextEditingController();
  final TextEditingController _medicalHistoryController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _gender;
  bool? _error = true, show = false, loading = false;
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
  }

  void _register() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_error == true) {
      show = true;
    } else {
      show = false;
      setState(() {
        loading = true;
      });
      try {
        await AuthenticationServices().updateUser(
          bloodType: (_bloodTypeController.text.isNotEmpty)
              ? _bloodTypeController.text
              : null,
          gender: _gender!,
          birthDate: (_birthdayController.text.isNotEmpty)
              ? _birthdayController.text
              : null,
          allergyToMedications: (_allergyController.text.isNotEmpty)
              ? _allergyController.text
              : null,
          medicalHistory: (_medicalHistoryController.text.isNotEmpty)
              ? _medicalHistoryController.text
              : null,
          height: (_heightController.text.isNotEmpty)
              ? _heightController.text
              : null,
          weight: (_weightController.text.isNotEmpty)
              ? _weightController.text
              : null,
        );
        setState(() {
          loading = false;
        });

        Navigator.pushNamed(context, "/navigationmenu");
      } catch (e) {
        setState(() {
          loading = false;
        });
        _showToast(e.toString());
      }
    }
    setState(() {});
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
            ? _form(context)
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Complete Your Information",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Gender: ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),

            Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Radio<String>(
                    activeColor: KColors.primary,
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                        _error = false;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text("Female"),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Radio<String>(
                    activeColor: KColors.primary,
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                        _error = false;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text("Male"),
              ],
            ),
            if (show == true)
              Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    " Gender is required",
                    style: TextStyle(color: Colors.red.shade900, fontSize: 12),
                  ),
                ],
              ),
            const SizedBox(height: 16),

            // Birthday
            TextFormField(
              readOnly: true,
              onTap: () {
                _selectData(context, _birthdayController);
              },
              controller: _birthdayController,
              decoration: const InputDecoration(
                labelText: "Birthdate",
              ),
              validator: (value) =>
                  KValidator.validateEmptyText("Birth Date", value),
            ),
            const SizedBox(height: 16),

            // Blood Type
            DropdownButtonFormField(
              items: ["A+", "A-", "B+", "B-", "O+", "O-"].map((item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              dropdownColor: Colors.white,
              decoration:
                  const InputDecoration(labelText: "Blood Type (optioanl)"),
              onChanged: (value) {
                setState(() {
                  _bloodTypeController.text = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _weightController,
                    decoration: const InputDecoration(
                      labelText: "Weight (kg) (optioanl)",
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          double.tryParse(value) == null) {
                        return "Enter a valid number";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _heightController,
                    decoration: const InputDecoration(
                      labelText: "Height (cm) (optioanl)",
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          double.tryParse(value) == null) {
                        return "Enter a valid number";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _allergyController,
              decoration: const InputDecoration(
                labelText: "Allergy to Medications (Optional)",
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _midicalHistory,
              decoration: const InputDecoration(
                labelText: "Midical History (optioanl)",
              ),
            ),
            const SizedBox(height: 16),

            // Register Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _register,
                child: const Text(
                  "Register",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectData(
      BuildContext context, TextEditingController date) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1950),
      lastDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary:
                  Color.fromARGB(255, 131, 162, 247), // header background color
              onPrimary: Colors.black, // header text color
              onSurface: KColors.primary, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 16),
                foregroundColor: KColors.primary, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      date.text = picked.toString().split(" ")[0];
    }
  }
}
