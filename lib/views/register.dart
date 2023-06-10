// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_flutter_form_mvc_architecture/controllers/authentication_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends StateMVC<RegisterScreen> {
  final AuthenticationController _authenticationController =
      AuthenticationController();

  _RegisterScreenState() : super(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _authenticationController.scaffoldKey,
        appBar: AppBar(title: const Text("Register")),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: _authenticationController.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          validator: (item) =>
                              item!.length > 2 ? null : "Enter valid name",
                          onSaved: (item) => _authenticationController
                              .registerModel.name = item!,
                          decoration: const InputDecoration(
                              hintText: "Name", border: OutlineInputBorder())),
                      const SizedBox(height: 20.0),
                      TextFormField(
                          validator: (item) =>
                              item!.contains("@") ? null : "Enter Valid Email",
                          onSaved: (item) => _authenticationController
                              .registerModel.email = item!,
                          decoration: const InputDecoration(
                              hintText: "Email", border: OutlineInputBorder())),
                      const SizedBox(height: 20.0),
                      TextFormField(
                          validator: (item) => item!.length > 6
                              ? null
                              : "Password should be more than 6 chars",
                          onSaved: (item) => _authenticationController
                              .registerModel.password = item!,
                          obscureText: _authenticationController.showPassword
                              ? false
                              : true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {_authenticationController.showPassword = !_authenticationController.showPassword; });
                                  },
                                  icon: Icon(
                                      _authenticationController.showPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off)))),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                          onPressed: () {
                            _authenticationController.register();
                          },
                          child: const Text("Register"))
                    ],
                  ))),
        ));
  }
}
