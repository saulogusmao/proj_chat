import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proj_chat/components/auth_form.dart';
import 'package:proj_chat/core/models/auth_form_data.dart';
import 'package:proj_chat/core/services/auth/auth_firebase_service.dart';
import 'package:proj_chat/core/services/auth/auth_service.dart';

class AuthPage extends StatefulWidget {
  //'stafeful' devido ao 'mode login'
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      if (!mounted) return;
      setState(() {
        _isLoading = true;
      });
      if (formData.isLogin) {
        //login
        await AuthService().login(
          formData.email,
          formData.password,
        );
      } else {
        //Signup
        await AuthService().signup(
          formData.name,
          formData.email,
          formData.password,
          formData.image,
        );
      }
    } catch (error) {
      //tratar erro
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
    print('AuthPage...');
    print(formData.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: AuthForm(
                onSubmit: _handleSubmit,
              ),
            ),
          ),
          if (_isLoading)
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
