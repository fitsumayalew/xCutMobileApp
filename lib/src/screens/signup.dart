import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/bloc/authetication/auth_event.dart';
import 'package:xcut_frontend/src/bloc/authetication/bloc.dart';
import 'package:xcut_frontend/src/bloc/user/bloc.dart';
import 'package:xcut_frontend/src/bloc/user/user_event.dart';
import 'package:xcut_frontend/src/models/user.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKeySignup = GlobalKey<FormState>();

  final Map<String, dynamic> _user = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: Text('REGISTER',
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor))),
                Form(
                  key: _formKeySignup,
                  child: Column(children: [
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Username / email',
                            hintStyle: GoogleFonts.poppins(
                                color: Colors.grey.shade700,
                                letterSpacing: 0.5),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15.0),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade700, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2.5),
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
                              this._user['password'] = value;
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
                                color: Colors.grey.shade700,
                                letterSpacing: 0.5),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15.0),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade700, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2.5),
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
                            final AuthEvent event = AuthCreate(User(
                                email: this._user['email'],
                                password: this._user['password'],
                                favorites: null,
                                createdAt: null));
                            BlocProvider.of<AuthBloc>(context).add(event);
                            Navigator.pushNamed(context, '/');
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?',
                            style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white54)),
                        FlatButton(
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColor),
                          ),
                          color: Theme.of(context).primaryColorDark,
                          onPressed: () =>
                              {Navigator.pushNamed(context, '/login')},
                        ),
                      ],
                    )
                  ]),
                )
              ]),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
    );
  }
}
