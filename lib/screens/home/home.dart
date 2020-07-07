import 'package:coffee_brew/models/brew.dart';
import 'package:coffee_brew/screens/home/settings_form.dart';
import 'package:coffee_brew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:coffee_brew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:coffee_brew/screens/home/brew_list.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container (
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
        value: DatabaseService().brews,
        child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brews and Beans'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text('logout'),
              icon: Icon(Icons.person),
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}