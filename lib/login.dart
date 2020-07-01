import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './custom_icon_icons.dart';

class Login extends StatefulWidget {
  @override
  LoginFormWidget createState() {
    return LoginFormWidget();
  }
}

class LoginFormWidget extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var _userEmailController = TextEditingController(text: "jm1@example.com");
  var _userPasswordController = TextEditingController(text: "jay@123");
  var _emailFocusNode = FocusNode();
  var _passwordFocusNode = FocusNode();
  bool _isPasswordVisible = true;
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    _clearAllFields();
    return Container(
      margin: EdgeInsets.only(top: 470),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _buildEmailField(context),
                  _buildPasswordField(context),
                  _buildSignInButton(context),
                  _buildSignUp(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _userNameValidation(String value) {
    if (value.isEmpty) {
      return "Please enter valid user name";
    } else {
      return null;
    }
  }

  Widget _buildEmailField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextFormField(
        controller: _userEmailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        style: TextStyle(fontSize: 30),
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        validator: (value) => _emailValidation(value),
        decoration: InputDecoration(
          prefixIcon: Icon(
            CustomIcon.icon_feather_user,
            color: Colors.black,
            size: 40,
          ),
          labelText: "Username",
          hintText: "",
          labelStyle: TextStyle(color: Colors.black, fontSize: 30),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0),
          ),
        ),
      ),
    );
  }

  String _emailValidation(String value) {
    bool emailValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    if (!emailValid) {
      return "Enter valid email address";
    } else {
      return null;
    }
  }

  Widget _buildPasswordField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      child: TextFormField(
        controller: _userPasswordController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        style: TextStyle(fontSize: 30),
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_emailFocusNode);
        },
        validator: (value) => _userNameValidation(value),
        obscureText: _isPasswordVisible,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: Icon(
              CustomIcon.icon_feather_lock,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () => {},
          ),
          labelText: " Password",
          labelStyle: TextStyle(color: Colors.black, fontSize: 30),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        width: double.infinity,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "SIGN IN",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          onPressed: () {
            _signUpProcess(context);
          },
        ),
      ),
    );
  }

  void _signUpProcess(BuildContext context) {
    var validate = _formKey.currentState.validate();

    if (validate) {
      //Do login stuff
      Navigator.pushNamed(context, '/midpage');
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void _clearAllFields() {
    setState(() {
      _userEmailController = TextEditingController(text: "");
      _userPasswordController = TextEditingController(text: "");
    });
  }

  Widget _buildSignUp() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: "Don't have an Account ? ",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
            ),
            TextSpan(
              text: ' SIGN UP',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  fontSize: 20),
              recognizer: new TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, '/signup');
                },
            ),
          ],
        ),
      ),
    );
  }
}
