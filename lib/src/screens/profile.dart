import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/bloc/user/bloc.dart';
import 'package:xcut_frontend/src/bloc/user/user_event.dart';
import 'package:xcut_frontend/src/bloc/user/user_state.dart';
import 'package:xcut_frontend/src/utils/token_handler.dart';

import '../bloc/user/bloc.dart';
import '../bloc/user/user_event.dart';
import '../utils/token_handler.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: TokenHandler.getToken(),
        builder: (_, snapshot) {
          if (snapshot.data == null) {
            return Center(
                child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2,
                    child: RaisedButton(
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        ),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: BorderSide(color: Colors.grey.shade700)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        })));
          } else {}
          return ListView(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: Text('Logout',
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.grey, width: 1.5)),
                  onPressed: () {
                    logout(context);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Image(
                    image: NetworkImage(
                        'https://img.favpng.com/15/8/8/user-profile-2018-in-sight-user-conference-expo-business-default-png-favpng-5EdhQJprgN1HKZdx50LCN4zXg.jpg'),
                    fit: BoxFit.cover)),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserOperationFailure) {
                  return Center(child: Text('error'));
                }
                if (state is UserLoading) {
                  BlocProvider.of<UserBloc>(context).add(UserLoad());
                }
                if (state is UserLoadSuccess) {
                  return Center(
                    child: Text(
                      '@${state.user.email.toString().split('@')[0]}',
                      style:
                          GoogleFonts.poppins(color: Colors.grey, fontSize: 20),
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: FlatButton(
                child: Text('Change Password',
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1.5)),
                onPressed: () {
                  Navigator.pushNamed(context, '/changePassword');
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: FlatButton(
                child: Text('Delete Account',
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1.5)),
                onPressed: () async {
                  final userToken = await TokenHandler.getToken();
                  BlocProvider.of<UserBloc>(context).add(UserDelete(userToken));
                  Navigator.pushNamed(context, '/');
                },
              ),
            )
          ]);
        },
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
    );
  }
}

logout(BuildContext context) async {
  await TokenHandler.removeToken();
  Navigator.pushNamed(context, '/');
}

// changePassword(BuildContext context) {
//   BlocProvider<UserBloc>.of(context).add(UserUpdate())
// }
