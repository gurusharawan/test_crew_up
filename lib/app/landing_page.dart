import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_crew_up/app/sign_in/sign_in_page.dart';
import 'package:test_crew_up/services/auth.dart';

import 'home/home_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<AuthUser>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            AuthUser user = snapshot.data;
            if (user == null) {
              return SignInPage.create(context);
            }
            return Provider<AuthUser>.value(
              value: user,
              child:  HomePage(),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
