import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/bloc/user/bloc.dart';
import 'package:xcut_frontend/src/bloc/user/user_event.dart';
import 'package:xcut_frontend/src/models/barberShop.dart';
import 'package:xcut_frontend/src/widgets/review.dart';
import '../bloc/user/bloc.dart';
import '../bloc/user/user_event.dart';
import '../utils/token_handler.dart';
import '../widgets/review.dart';

class BarberShopDetails extends StatefulWidget {
  final BarberShop barberShop;
  BarberShopDetails(this.barberShop);
  @override
  _BarberShopDetailsState createState() => _BarberShopDetailsState();
}

class _BarberShopDetailsState extends State<BarberShopDetails> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _review = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      onPressed: () => {_showDialog(context)})
                ],
              ),
            ),
            if (widget.barberShop.review.isEmpty)
              Text(
                "No reviews",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.barberShop.review.length,
                itemBuilder: (context, index) {
                  return ReviewCard(
                      widget.barberShop.review[index].email,
                      widget.barberShop.review[index].dateTime,
                      widget.barberShop.review[index].rating,
                      widget.barberShop.review[index].review);
                }),
            // reviews(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: FutureBuilder(
          future: TokenHandler.getUserRole(),
          builder: (context, snapshot) {
            if (snapshot.data != 'UNVERIFIED_USER') {
              return SizedBox(
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
                            color: Theme.of(context).primaryColor, width: 1.5)),
                    onPressed: () => {
                      BlocProvider.of<UserBloc>(context)
                          .add(UserSetAppointment(widget.barberShop.id)),
                      Navigator.pushNamed(context, '/')
                    },
                  ),
                ),
              );
            } else {}
            return null;
          },
        ),
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
    );
  }

  _showDialog(BuildContext context) async {
    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        insetPadding: EdgeInsets.symmetric(vertical: 20),
        backgroundColor: Theme.of(context).primaryColorDark,
        contentPadding: const EdgeInsets.all(16.0),
        content: Container(
          height: MediaQuery.of(context).size.height / 3,
          width: 4 * MediaQuery.of(context).size.width / 5,
          child: new Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Review Text',
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.grey.shade700, letterSpacing: 0.2),
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
                      return 'Please enter review and rating';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      this._review['review'] = value;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Rating 1 - 5',
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.grey.shade700, letterSpacing: 0.2),
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
                      return 'Please enter review and rating';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      this._review['rating'] = int.parse(value);
                    });
                  })
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
              child: Text('Cancel',
                  style: GoogleFonts.poppins(color: Colors.grey)),
              onPressed: () {
                Navigator.pop(context);
              }),
          new FlatButton(
              child: Text('Rate',
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).primaryColor)),
              onPressed: () {
                BlocProvider.of<UserBloc>(context)
                    .add(UserAddReview(widget.barberShop.id));
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}

// Widget reviews() {
//   return Column(children: [ReviewCard(), ReviewCard(), ReviewCard()]);
// }
