import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr_flutter_1/res/colors.dart';

typedef String? Validator(String? value);
typedef String? ValidatorFieldConfirm(String? pass, String? confirmPass);

class InputWidget extends StatefulWidget {
  TextEditingController? fieldController;
  String _label = '';
  Validator? validator;

  InputWidget(String label,
      {Validator? validator,
        ValidatorFieldConfirm? fieldConfirmValidator,
        String? confirmField,
        TextEditingController? controller}) {
    this._label = label;
    this.fieldController = controller;

    this.validator = (value) {
      if (validator == null) {
        if (fieldConfirmValidator != null) {
          return fieldConfirmValidator(value, confirmField);
        }
      } else {
        return validator(value);
      }
      return null;
    };
  }

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(32.0),
    borderSide: BorderSide(color: AppColors.mainColor, width: 1.0),
  );

  OutlineInputBorder errorOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(32.0),
    borderSide: BorderSide(color: AppColors.errorColor, width: 1.0),
  );

  // void onChange(String value){
  //   if (_formKey.currentState!.validate()) {
  //     print(122);
  //   }
  // }

  // var focusNode = FocusNode();
  //
  // @override
  // void initState() {
  //   focusNode.addListener(() {
  //     print(focusNode.hasFocus);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0, bottom: 10),
          child: Text(
            widget._label,
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextFormField(
          // focusNode: focusNode,
          key: _formKey,
          // onChanged: onChange,
          controller: widget.fieldController,
          validator: widget.validator,
          style: TextStyle(),
          decoration: InputDecoration(
            hintText: '',
            errorBorder: errorOutlineInputBorder,
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            disabledBorder: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            focusedErrorBorder: outlineInputBorder,
          ),
        )
      ],
    );
  }
}
