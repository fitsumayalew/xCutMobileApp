import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/bloc/barbershop/barbershop_event.dart';
import 'package:xcut_frontend/src/bloc/barbershop/bloc.dart';
import 'package:xcut_frontend/src/bloc/user/bloc.dart';
import 'package:xcut_frontend/src/bloc/user/user_event.dart';
import 'package:xcut_frontend/src/models/barberShop.dart';
import 'package:xcut_frontend/src/widgets/review.dart';

import '../utils/token_handler.dart';

class BarberShopDetails extends StatefulWidget {
  final BarberShop barberShop;
  BarberShopDetails(this.barberShop);
  @override
  _BarberShopDetailsState createState() => _BarberShopDetailsState();
}

class _BarberShopDetailsState extends State<BarberShopDetails> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _user = {};
  final String userRole = '';
  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    await TokenHandler.getUserRole();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                    height: 2 * (MediaQuery.of(context).size.height / 5),
                    child: Image(
                      image: NetworkImage(widget.barberShop.image),
                      fit: BoxFit.fill,
                    )),
                Container(
                  height: 40,
                  child: Center(
                    child: Text(
                      widget.barberShop.name,
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '4.2',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      FlatButton(
                          child: Text(
                            'Add Review',
                            style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.amber.shade500),
                          ),
                          color: Theme.of(context).primaryColorDark,
                          onPressed: () => {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Form(
                                            key: _formKey,
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  TextFormField(
                                                      keyboardType:
                                                          TextInputType
                                                              .multiline,
                                                      maxLines: 5,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'Review',
                                                        hintStyle:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                                letterSpacing:
                                                                    0.5),
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        15.0),
                                                        filled: true,
                                                        fillColor:
                                                            Colors.white70,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          50.0)),
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700,
                                                                  width: 1),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          50.0)),
                                                          borderSide: BorderSide(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
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
                                                        setState(() => {
                                                              // this._user['email'] = value.trim();
                                                              this._user[
                                                                      'email'] =
                                                                  'amexabiy@gmail.com'
                                                            });
                                                      }),
                                                  TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'rating',
                                                        hintStyle:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                                letterSpacing:
                                                                    0.5),
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        15.0),
                                                        filled: true,
                                                        fillColor:
                                                            Colors.white70,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          50.0)),
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700,
                                                                  width: 1),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          50.0)),
                                                          borderSide: BorderSide(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
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
                                                          // this._user['email'] = value.trim();
                                                          this._user['email'] =
                                                              'amexabiy@gmail.com';
                                                        });
                                                      }),
                                                ])),
                                      );
                                    })
                              })
                    ],
                  ),
                ),
                reviews(),
              ],
            ),
          ),
          userRole == 'UNVERIFIED_USER'
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 10.5,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10),
                    child: RaisedButton(
                      child: Text(
                        'Book Appointment',
                        style: GoogleFonts.poppins(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor),
                      ),
                      color: Theme.of(context).primaryColorDark,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.5)),
                      onPressed: () => {
                        BlocProvider.of<UserBloc>(context)
                            .add(UserSetAppointment(widget.barberShop.id)),
                        Navigator.pushNamed(context, '/')
                      },
                    ),
                  ),
                )
              : null,
        ],
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
    );
  }
}

Widget reviews() {
  return Column(children: [ReviewCard(), ReviewCard(), ReviewCard()]);
}

reviewDialog(BuildContext context) {
  return;
}
