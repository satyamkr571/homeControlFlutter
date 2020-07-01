import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './custom_icon_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUp extends StatefulWidget {
  @override
  SignUpFormWidget createState() {
    return SignUpFormWidget();
  }
}

class SignUpFormWidget extends State<SignUp> {
  SignUpFormWidget({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  final _formKey = GlobalKey<FormState>();
  var _userEmailController = TextEditingController(text: "jm1@example.com");
  var _userUserController = TextEditingController(text: "jm1");
  var _userPasswordController = TextEditingController(text: "jay@123");
  var _emailFocusNode = FocusNode();
  var _passwordFocusNode = FocusNode();
  bool _isPasswordVisible = true;
  bool _autoValidate = false;
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    _clearAllFields();
    return Container(
      margin: EdgeInsets.only(top: 244),
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
                  _buildUserField(context),
                  _buildPasswordField(context),
                  _buildEmailField(context),
                  _buildSignUp(),
                  _buildSignUpButton(context),
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

  Widget _buildUserField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: TextFormField(
        controller: _userUserController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        style: TextStyle(fontSize: 30),
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        validator: (value) => _userValidation(value),
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

  Widget _buildEmailField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
            CustomIcon.icon_feather_mail,
            color: Colors.black,
            size: 40,
          ),
          labelText: " Email",
          hintText: "",
          labelStyle: TextStyle(color: Colors.black, fontSize: 30),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
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

  String _userValidation(String value) {
    bool userValid = RegExp(r"^[a-zA-Z0-9.]+").hasMatch(value);
    if (!userValid) {
      return "Enter valid username";
    } else {
      return null;
    }
  }

  Widget _buildPasswordField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
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

  Widget _buildSignUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 35.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        width: double.infinity,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "SIGN UP",
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
      _userUserController = TextEditingController(text: "");
      _userEmailController = TextEditingController(text: "");
      _userPasswordController = TextEditingController(text: "");
    });
  }

  Widget _buildSignUp() {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: _value,
            onChanged: (bool newValue) {
              {
                setState(() {
                  _value = newValue;
                });
              }
            },
            checkColor: Colors.cyan[900],
            activeColor: Colors.cyan[900],
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: "I have accepted the ",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
                  ),
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontSize: 18,
                        decoration: TextDecoration.underline),
                    recognizer: new TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
