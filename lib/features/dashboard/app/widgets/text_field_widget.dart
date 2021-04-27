import 'package:flutter/material.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String textFieldTitle;
  final TextEditingController textFieldController;
  final String hintText;
  final Function onChanged;
  final Function onTapAddButton;
  final bool validate;

  const CustomTextFieldWidget({
    Key key,
    this.textFieldTitle,
    this.textFieldController,
    this.hintText,
    this.onChanged,
    this.onTapAddButton,
    @required this.validate,
  }) : super(key: key);
  @override
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textFieldTitle,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Theme.of(context).accentColor,
          ),
        ),
        Container(
          width: 250.0,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: widget.textFieldController,
                  decoration: InputDecoration(
                    //labelText: 'Create a Project',
                    hintText: widget.hintText,
                    errorText:
                        widget.validate ? AppStrings.projectHasNoName : null,
                  ),
                  onChanged: (value) {
                    widget.onChanged(value);
                  },
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Please Enter a name';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              InkWell(
                onTap: () {
                  //create a project
                  widget.onTapAddButton();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: Quantity.addButtonSquareSide,
                  height: Quantity.addButtonSquareSide,
                  color: Colors.greenAccent,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
