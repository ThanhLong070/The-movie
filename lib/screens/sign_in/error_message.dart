import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/blocs/auth/auth_bloc.dart';
import 'package:the_movie/blocs/auth/auth_state.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is LoginFailed) {
        return Text(
          state.message,
          style: const TextStyle(color: Colors.red, fontSize: 16.0),
        );
      } else if (state is LoginLoading) {
        return Center(
          child: Platform.isAndroid
              ? const CircularProgressIndicator()
              : const CupertinoActivityIndicator(
                  radius: 20.0,
                  color: Color.fromARGB(255, 1, 180, 228),
                ),
        );
      } else {
        return Container();
      }
    });
  }
}
