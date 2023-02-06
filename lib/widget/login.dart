import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneCtrol = TextEditingController();
  final _passCtrol = TextEditingController();
  final _fromKey = GlobalKey<FormState>();

  void _onSubmit() {
    if (_fromKey.currentState!.validate()) print("amjilttai");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Form(
        key: _fromKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's sing you in.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Welcome back.",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                Text(
                  "You've been missed!",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                SizedBox(height: 30),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Хоосон байж болохгүй";
                    return null;
                  },
                  controller: _phoneCtrol,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.9), width: 1)),
                    label: Text("Утасны дугаар"),
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Хоосон байж болохгүй";
                    return null;
                  },
                  controller: _passCtrol,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.9), width: 1)),
                    label: Text("Нууц үг"),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: _onSubmit,
                  child: Text("Нэвтрэх"),
                ))
          ],
        ),
      ),
    );
  }
}
