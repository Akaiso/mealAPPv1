import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginValidation extends StatefulWidget {
  LoginValidation({Key key}) : super(key: key);

  @override
  State<LoginValidation> createState() => _LoginValidation();
}

var cont1 = TextEditingController();
final cont2 = TextEditingController();



GlobalKey<FormState> loginKey = GlobalKey<FormState>();

class _LoginValidation extends State<LoginValidation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      // onChanged: (value){},
                      validator: (value) {
                        if (value.trim().isEmpty || !value.contains("@")) {
                          return 'invalid email';
                        }
                        return '';
                      },
                      //  onSaved: (){},
                      controller: cont1,
                      decoration: InputDecoration(
                        hintText: 'example@yahoo.com',
                        filled: true,
                        fillColor: Colors.black12,
                        enabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.0, style: BorderStyle.solid)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      validator: (value) {
                        if (value.trim().length < 6) {
                          return 'password must be more than 6 characters';
                        }
                        return " ";
                      },
                      obscureText: true,
                      controller: cont2,
                      decoration: InputDecoration(
                        hintText: 'password',
                        filled: true,
                        fillColor: Colors.black12,
                        enabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.0, style: BorderStyle.solid)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: ()  {
                      if (loginKey.currentState.validate()) {
                         loginKey.currentState.save();
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('LogIn Successfull')));
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
