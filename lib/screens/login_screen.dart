import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/Widgets/custom_button.dart';
import 'package:scholar_chat/Widgets/custom_text_field.dart';
import 'package:scholar_chat/constant.dart';
import 'package:scholar_chat/screens/chat_screen.dart';
import 'package:scholar_chat/screens/cubits/login_cubit/login_cubit.dart';
import 'package:scholar_chat/screens/register_screen.dart';

import '../helper/show_snackbar.dart';

class LoginPage extends StatelessWidget {
  String? email;

  String? password;

  bool isLoading = false;

  bool _obscureText = true;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.of(context).pushNamed(ChatScreen.id);
        } else if (state is LoginFailure) {
          showSnackBar(context, 'something went wrong');
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: KprimaryColor,
          body: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset(Klogo),
                Text(
                  'Scholar Chat',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Sign In',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomTextFormField(
                  onChange: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                  obscureText: false,
                ),
                CustomTextFormField(
                  onChange: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                  obscureText: _obscureText,
                  viewIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      // setState(() {
                      //   _obscureText = false;
                      // });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context)
                            .loginUser(email: email!, password: password!);
                      } else {}
                    },
                    textButton: 'Login',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an accont',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return RegisterPage();
                            },
                          ));
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.blueAccent),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
