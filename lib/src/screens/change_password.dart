import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/bloc/user/bloc.dart';
import 'package:xcut_frontend/src/bloc/user/user_event.dart';
import 'package:xcut_frontend/src/models/models.dart';
import 'package:xcut_frontend/src/utils/token_handler.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKeySignup = GlobalKey<FormState>();
  final Map<String, dynamic> _user = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKeySignup,
          child: Column(children: [
            SizedBox(
              height: 50,
              child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Username / email',
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.grey.shade700, letterSpacing: 0.5),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade700, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.5),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      this._user['oldPassword'] = value;
                    });
                  }),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 50,
              child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.grey.shade700, letterSpacing: 0.5),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide:
                          BorderSide(color: Colors.grey.shade700, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.5),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      this._user['password'] = value;
                    });
                  }),
            ),
            SizedBox(height: 50),
            SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(
                        fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.grey.shade700)),
                  onPressed: () {
                    final form = _formKeySignup.currentState;
                    if (form.validate()) {
                      form.save();
                      changePassword(context, this._user);
                    }
                  },
                )),
            FlatButton(
              child: Text('Change Password',
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).primaryColor)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1.5)),
              onPressed: () {},
            ),
          ]),
        ),
      ),
    );
  }
}

changePassword(BuildContext context, Map<String, String> userPassword) async {
  BlocProvider.of<UserBloc>(context)
      .add(UserUpdate(userPassword['oldPassword'], userPassword['password']));
  await TokenHandler.removeToken();
  Navigator.pushNamed(context, '/login');
}
