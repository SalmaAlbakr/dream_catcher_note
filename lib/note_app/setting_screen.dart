import 'package:dream_catcher_note/main.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  clipBehavior: Clip.hardEdge,
                  onPressed: (){
                    //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ChangeColor()));

                    if (context.locale == Locale('ar')){

                      context.setLocale(Locale('en'));
                    } else{
                      context.setLocale(Locale('ar'));
                    }
                  }, child: Text("Lang".tr(),style: TextStyle(color: Colors.black),)),
              ElevatedButton(
                  onPressed: () => FirstScreen.of(context).changeTheme(ThemeMode.light),
                  child: Text('Light')),
              ElevatedButton(
                  onPressed: () => FirstScreen.of(context).changeTheme(ThemeMode.dark),
                  child: Text('Dark')),
            ],
          ),
        ),
      ),
    );
  }
}
