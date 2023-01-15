import 'package:flutter/material.dart';
import 'package:letsblog_flutter/constraints.dart';
import 'package:letsblog_flutter/utils.dart';


// Search Form
class SearchForm extends StatefulWidget {
  SearchForm({Key? key, required this.press}) : super(key: key);

  final Function press;
  @override
  State<SearchForm> createState() => _SearchFormState(press: press);
}

class _SearchFormState extends State<SearchForm> {
  _SearchFormState({required this.press});

  final searchController = TextEditingController();
  final Function press;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      // Fetch data from backend
      print(searchController.text);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double ds = getSize(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(ds * 2, ds * 2, ds * 2, 0), // 20, 20, 20, 0
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          fillColor: KBlack.withOpacity(.1),
          filled: true,
          contentPadding:
          EdgeInsets.symmetric(horizontal: ds * 2.5, vertical: 0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ds * 3),
              borderSide: BorderSide(width: 0, color: KBlack.withOpacity(.2))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ds * 3),
              borderSide: BorderSide(width: 0, color: KBlack.withOpacity(.2))),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ds * 3),
          ),
        ),
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: ds * 1.6,
            fontWeight: FontWeight.w500,
            color: KBlack.withOpacity(.8)),
        cursorColor: Color(0xFF595959),
        cursorWidth: ds * .3,
      ),
    );
  }
}
