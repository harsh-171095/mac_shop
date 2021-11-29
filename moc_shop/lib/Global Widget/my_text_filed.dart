import 'package:flutter/material.dart';
import '../Global/validation.dart';

//ignore: must_be_immutable
class MyTextFiled extends StatefulWidget {
  @override
  State<MyTextFiled> createState() {
    // _stateObj = _StateHKTextFiled();
    return _StateHKTextFiled();
  }

  MyTextFiled(
      {Key? key,
      this.placehoder = "",
      this.textColor = Colors.black,
      this.borderColor,
      this.keyboradSapce = 70,
      this.onChange})
      : super(key: key);

//Property variables
  String placehoder;
  Color textColor;
  BorderColors? borderColor;
  double keyboradSapce;
  Function(String)? onChange;

  TextEditingController controller = TextEditingController();
  _StateHKTextFiled? _stateObj = _StateHKTextFiled();
  String get text => controller.text;
  set text(String text) {
    controller.text = text;
  }

  void showError(String message) {
    if (_stateObj != null) {
      _stateObj!.showError(message);
    }
  }

  bool isValidate(ValidationType type) {
    var validation = Validation().getValidation(type, text);
    if (validation.status == false) {
      showError(validation.message);
    }
    return validation.status;
  }
}

class _StateHKTextFiled extends State<MyTextFiled> {
  bool _isShowError = false;
  bool _isFocuse = false;
  String _errorMessage = "message";
  final FocusNode _focusNode = FocusNode();

  OutlineInputBorder get border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(45 / 2),
      borderSide: BorderSide(
          color: _isShowError
              ? widget.borderColor!.onError
              : (_isFocuse
                  ? widget.borderColor!.onFocuse
                  : widget.borderColor!.onLostFocuse),
          width: 1.0),
    );
  }

  @override
  void initState() {
    super.initState();
    widget._stateObj = this;
    widget.borderColor ??= BorderColors();
    _focusNode.addListener(() {
      setState(() {
        _isFocuse = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 45,
            child: TextField(
              controller: widget.controller,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: widget.placehoder,
                contentPadding: const EdgeInsets.only(left: 12, right: 10),
                border: border,
                enabledBorder: border,
                focusedBorder: border,
              ),
              scrollPadding: EdgeInsets.only(bottom: widget.keyboradSapce),
              onChanged: _didChangeText,
            ),
          ),
          _isShowError
              ? SizedBox(
                  height: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Text(
                      _errorMessage,
                      style: const TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.normal,
                          color: Colors.red),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  void showError(String message) {
    setState(() {
      _isShowError = true;
      _errorMessage = message;
    });
  }

  void _didChangeText(String text) {
    if (widget.onChange != null) {
      widget.onChange!(text);
    }
    if (_isShowError) {
      setState(() {
        _isShowError = false;
        _errorMessage = "";
      });
    }
  }
}

class BorderColors {
  final Color onLostFocuse;
  final Color onFocuse;
  final Color onError;

  BorderColors(
      {this.onLostFocuse = Colors.black12,
      this.onFocuse = Colors.black87,
      this.onError = Colors.red});
}
