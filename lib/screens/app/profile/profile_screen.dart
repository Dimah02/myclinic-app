import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myclinic/data/auth/login_service.dart';
import 'package:myclinic/data/auth/user.dart';
import 'package:myclinic/navigation_menu.dart';
import 'package:myclinic/utils/constants/colors.dart';
import 'package:myclinic/utils/helpers/validation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _bloodTypeController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _allergyController = TextEditingController();
  final TextEditingController _midicalHistory = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  bool loading = false;
  String? _gender;
  bool? _error = true, show = false, enabled = false;
  late FToast fToast;
  @override
  void initState() {
    super.initState();
    _firstNameController.text = User().getUser()!.name!.split(' ')[0];
    _lastNameController.text = User().getUser()!.name!.split(' ')[1];
    _emailController.text = User().getUser()!.email!;
    _birthdayController.text = User().getUser()!.birthDate!;
    _gender = User().getUser()!.gender;
    _genderController.text = User().getUser()!.gender ?? '';
    _bloodTypeController.text = User().getUser()!.bloodType ?? '';
    _weightController.text = User().getUser()!.weight!.toString();
    _heightController.text = User().getUser()!.height!.toString();
    _allergyController.text = User().getUser()!.allergyToMedications ?? '';
    _midicalHistory.text = User().getUser()!.medicalHistory ?? '';
    fToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: (loading == false)
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(), child: _form(context))
            : const Center(
                child: CircularProgressIndicator(
                  color: KColors.primary,
                ),
              ),
      ),
    );
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
          birthDate: (_birthdayController.text.isNotEmpty)
              ? _birthdayController.text
              : null,
          allergyToMedications: (_allergyController.text.isNotEmpty)
              ? _allergyController.text
              : null,
          medicalHistory:
              (_midicalHistory.text.isNotEmpty) ? _midicalHistory.text : null,
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
        enabled = false;
        setState(() {});
      } catch (e) {
        setState(() {
          loading = false;
        });
        print(e);
        _showToast(e.toString());
      }
    }
    setState(() {});
  }

  Form _form(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
                if (enabled == false)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        enabled = true;
                        setState(() {});
                      },
                      child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: KColors.primary,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(
                            Icons.mode_edit_outlined,
                            color: Colors.white,
                          )),
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  enabled: enabled,
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
                  enabled: enabled,
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
            enabled: enabled,
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

          if (enabled == true)
            Column(
              children: [
                TextFormField(
                  enabled: enabled,
                  controller: _genderController,
                  decoration: const InputDecoration(
                    labelText: "Gender",
                  ),
                  validator: (value) =>
                      KValidator.validateEmptyText("Gender", value),
                ),
                const SizedBox(height: 16),
              ],
            ),

          // Birthday
          TextFormField(
            enabled: enabled,
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
          enabled == false
              ? TextFormField(
                  enabled: enabled,
                  readOnly: true,
                  onTap: () {
                    _selectData(context, _birthdayController);
                  },
                  controller: _bloodTypeController,
                  decoration: const InputDecoration(
                    labelText: "Blood Type (optioanl)",
                  ),
                  validator: (value) =>
                      KValidator.validateEmptyText("Blood Type", value),
                )
              : DropdownButtonFormField(
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
                  enabled: enabled,
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
                  enabled: enabled,
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
            enabled: enabled,
            controller: _allergyController,
            decoration: const InputDecoration(
              labelText: "Allergy to Medications (Optional)",
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            enabled: enabled,
            controller: _midicalHistory,
            decoration: const InputDecoration(
              labelText: "Midical History (optioanl)",
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: enabled == false
                    ? () {
                        NavigationController.instance.selectedIndex.value = 0;
                        Navigator.pop(context);
                      }
                    : _register,
                child: Text(enabled == false ? "Log out" : "Update")),
          ),
          const SizedBox(height: 32),
        ],
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
