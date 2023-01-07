import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/models/BlogCategories.dart';
import 'package:letsblog_flutter/utils.dart';

// Custom Dropdownn Input Field
class DropdownInputField extends StatefulWidget {
  DropdownInputField({Key? key, required this.press}) : super(key: key);

  final Function press;

  @override
  State<DropdownInputField> createState() => _DropdownInputFieldState();
}

class _DropdownInputFieldState extends State<DropdownInputField> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: TextStyle(fontFamily: 'Poppins', color: KBlack.withOpacity(.8)),
        ),
        SizedBox(height: 5),
        Container(
          height: 51,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: KBlack.withOpacity(.05),
              border: Border(bottom: BorderSide(width: 2, color: KBlack.withOpacity(.3)))
          ),
          child: DropdownButton(
            onChanged: (value) {
              setState(() {
                selectedCategory = value;
              });
              widget.press(value);
            },
            value: selectedCategory,
            items: categoryItems,
            itemHeight: 60,
            isExpanded: true,
            style: TextStyle(fontFamily: 'Poppins', color: KBlack),
            menuMaxHeight: MediaQuery.of(context).size.height/4,
          ),
        ),
      ],
    );
  }
}



// Custom Input Field
class CustomInputField extends StatefulWidget {
  CustomInputField({
    Key? key,
    int this.minLines=1,
    int this.maxLines=1,
    int? this.maxCharacters=150,
    required String this.title,
    required this.inputController,
  }) : super(key: key);

  final String title;
  final inputController;
  final int minLines, maxLines;
  final int? maxCharacters;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {

  @override
  void initState() {
    super.initState();
    widget.inputController.addListener(() {
      // Fetch data from backend
      print(widget.inputController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    double ds = getSize(context);
    if (widget.minLines > widget.maxLines){
      return SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Label
        Text(
          widget.title,
          style: TextStyle(fontFamily: 'Poppins', color: KBlack.withOpacity(.6)),
        ),
        SizedBox(height: 5,),

        // Input Field
        TextFormField(
          controller: widget.inputController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            fillColor: KBlack.withOpacity(.05),
            filled: true,
            focusColor: KBlack.withOpacity(.2),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: KPrimaryColor)
            ),
          ),
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: ds * 1.6
          ),
          maxLength: widget.maxCharacters,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
        ),

        // Add bottom padding if maxCharacters == null
        widget.maxCharacters == null ? SizedBox(height: 20,) : SizedBox(),
      ],
    );
  }
}