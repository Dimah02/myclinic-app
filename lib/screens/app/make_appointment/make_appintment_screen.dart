import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myclinic/common/loaders/full_screen_loader.dart';
import 'package:myclinic/common/success_screen/success_screen.dart';
import 'package:myclinic/data/app/get_appointmets.dart';
import 'package:myclinic/data/app/make_appointment.dart';
import 'package:myclinic/models/doctor_model.dart';
import 'package:myclinic/utils/constants/colors.dart';
import 'package:provider/provider.dart';

class MakeAppintmentScreen extends StatefulWidget {
  const MakeAppintmentScreen(
      {super.key, required this.app, required this.doctor});
  final List<Appointment> app;
  final DoctorModel doctor;

  @override
  State<MakeAppintmentScreen> createState() => _MakeAppintmentScreenState();
}

class _MakeAppintmentScreenState extends State<MakeAppintmentScreen> {
  Appointment? appointment;

  final TextEditingController _date = TextEditingController();
  final TextEditingController _showedDate = TextEditingController();
  DateTime _pickedDate = DateTime.now();

  final TextEditingController _stime = TextEditingController();
  final TextEditingController _etime = TextEditingController();

  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    _date.text = DateTime.now().toString();
    for (int i = 0; i < widget.app.length; i++) {
      if (widget.app[i].date.toString().split(" ")[0] ==
          DateTime.now().toString().split(" ")[0]) {
        appointment = widget.app[i];
        setState(() {});
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Book an appointment",
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Choose date and time",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // const SizedBox(height: 24),
              // TextFormField(
              //   readOnly: true,
              //   onTap: () {
              //     _selectData(context, _date);
              //     setState(() {});
              //   },
              //   controller: _showedDate,
              //   decoration: const InputDecoration(
              //     labelText: "Date",
              //   ),
              //   validator: (value) =>
              //       KValidator.validateEmptyText("Date", value),
              // ),
              const SizedBox(height: 24),
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.single,
                  daySplashColor: Colors.transparent,
                  selectedDayHighlightColor: KColors.primary,
                  firstDate: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day),
                  lastDate: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day + 30),
                ),
                value: [
                  _pickedDate,
                ],
                onValueChanged: (picked) {
                  _pickedDate = picked[0];
                  _date.text = picked[0].toString();
                  _showedDate.text = picked.toString().split(" ")[0];
                  for (int i = 0; i < widget.app.length; i++) {
                    if (widget.app[i].date.toString().split(" ")[0] ==
                        _date.text.split(" ")[0]) {
                      appointment = widget.app[i];
                      setState(() {});
                      return;
                    }
                  }
                  appointment = null;
                  setState(() {});
                },
              ),
              const Text(
                "Available Time",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 16,
                  runSpacing: 16,
                  children: (appointment != null)
                      ? appointment!.time!.map((e) {
                          return GestureDetector(
                            onTap: () {
                              if (e.available) {
                                _stime.text = e.start!;
                                _etime.text = e.end!;
                                setState(() {});
                              }
                            },
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                alignment: Alignment.center,
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: e.available
                                        ? (_stime.text == e.start)
                                            ? KColors.primary
                                            : KColors.secondary.withOpacity(0.2)
                                        : KColors.secondary,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Text(
                                  "${e.start} ${(e.start!.length == 4) ? "AM" : (int.parse(e.start!.substring(0, 2))) < 12 ? "AM" : "PM"}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: (_stime.text == e.start)
                                          ? Colors.white
                                          : Colors.black),
                                )),
                          );
                        }).toList()
                      : [],
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      await _showAlertDialog(context);
                    },
                    child: const Text("Confirm")),
              )
            ]),
          )),
    );
  }

  Future<void> _selectData(
      BuildContext context, TextEditingController date) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 7),
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
      date.text = picked.toString();
      _showedDate.text = picked.toString().split(" ")[0];
      for (int i = 0; i < widget.app.length; i++) {
        if (widget.app[i].date.toString().split(" ")[0] ==
            date.text.split(" ")[0]) {
          appointment = widget.app[i];
          setState(() {});
          return;
        }
      }
      appointment = null;
      setState(() {});
    }
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            "Are you sure about the information you've entered?",
            style: TextStyle(color: KColors.primary, fontSize: 16),
          ),
          content: SizedBox(
            //height: KHlper.screenHeight(context) * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Date: ${_date.text.split(" ")[0]}"),
                const SizedBox(
                  height: 8,
                ),
                Text("Time: ${_stime.text} -  ${_etime.text}"),
              ],
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Confirm'),
              onPressed: () async {
                // Handle the confirm action
                try {
                  MakeAppointmentService service = MakeAppointmentService();
                  KFullScreenLoader.openLoadingDialog(context,
                      text: "Booking Your Appintment");
                  await service.makeAppointment(
                    docotrID: widget.doctor.id!,
                    date: _date.text,
                    time: _stime.text,
                  );
                  if (context.mounted) {
                    KFullScreenLoader.stopLoading(context);
                    Navigator.of(context)
                      ..pop()
                      ..pop();

                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return SuccessScreen(
                        title: "Your Appointment is booked suceesfully",
                        subtitle:
                            "find all of your current appointments in history page",
                        imagesvg: "assets/images/done.svg",
                        onPress: () {
                          Navigator.of(context).pop();
                        },
                      );
                    }));
                  }
                  if (context.mounted) {
                    await Provider.of<GetAppointmentService>(context,
                            listen: false)
                        .getCurrentAppointments();
                  }
                } catch (e) {
                  if (context.mounted) {
                    KFullScreenLoader.stopLoading(context);
                    Navigator.of(context).pop();
                    _showToast("Please choose valid date and time");
                  }
                }
              },
            ),
          ],
        );
      },
    );
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
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
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
}
