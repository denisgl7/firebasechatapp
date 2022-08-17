import 'dart:io';

import 'package:flutter/material.dart';

import '../pickers/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  final void Function(String email, String password, String userName,
      File image, bool isLogin, BuildContext ctx) submitFn;

  final bool isLoading;

  const AuthForm(this.submitFn, this.isLoading);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';
  File? _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (_userImageFile == null && !_isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Пожалуйста выберите изображение'),
        backgroundColor: Theme.of(context).errorColor,
      ));
      return;
    }

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(),
          _userImageFile!, _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!_isLogin) UserImagePicker(_pickedImage),
                  TextFormField(
                    key: const ValueKey('email'),
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Введите существующий Email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Адрес email',
                    ),
                    onSaved: (value) {
                      _userEmail = value!;
                    },
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: const ValueKey('username'),
                      autocorrect: true,
                      textCapitalization: TextCapitalization.words,
                      enableSuggestions: false,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 4) {
                          return 'Введите не менее 4 символов';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(labelText: 'Имя пользователя'),
                      onSaved: (value) {
                        _userName = value!;
                      },
                    ),
                  TextFormField(
                    key: const ValueKey('password'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Пароль должен содержать не менее 6 символов';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Пароль',
                    ),
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value!;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (widget.isLoading) const CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                      onPressed: _trySubmit,
                      child: Text(_isLogin ? 'Войти' : 'Зарегистироваться'),
                    ),
                  if (!widget.isLoading)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(_isLogin
                          ? 'Создать учетную запись'
                          : 'У меня уже есть аккаунт'),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
