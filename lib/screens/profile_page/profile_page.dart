import 'package:flutter/material.dart';
import '../../models/colors.dart' as custom_colors;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final user = FirebaseAuth.instance.currentUser!;
  String userName = "";
  String email = "";
  String number = "";
  String durum = "";
  // AuthService authService = AuthService();
  final statusController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // gettingUserData();
  }

  // gettingUserData() async {
  //   await HelperFunctions.getUserEmailFromSF().then((value) {
  //     setState(() {
  //       email = value!;
  //     });
  //   });
  //   await HelperFunctions.getUserNameFromSF().then((val) {
  //     setState(() {
  //       userName = val!;
  //     });
  //   });
  //   await HelperFunctions.getUserNumberFromSF().then((val) {
  //     setState(() {
  //       number = val!;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: custom_colors.pinkPrimary,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("lib/images/aa.png"),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Change your profile photo",
                    style: TextStyle(color: custom_colors.pinkPrimary)),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 250,
                child: ListView(children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(
                      userName,
                      style: TextStyle(color: custom_colors.blackSecondary),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: Text(
                      email,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text(number),
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}
