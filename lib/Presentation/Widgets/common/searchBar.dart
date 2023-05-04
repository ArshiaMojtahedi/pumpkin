import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  Function(String text)? onChange;

  SearchBar({this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: Color(0xffF2F3F2),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Row(
            children: [
              Image.asset(
                "assets/images/search_icon.png",
                width: 18,
                height: 18,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  decoration: searchTextFieldDecoration("Search Store"),
                  onChanged: onChange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration searchTextFieldDecoration(String lable) {
  return InputDecoration(
    isDense: true,
    hintText: lable,
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    hintStyle: TextStyle(
      color: Color(0xff7C7C7C),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
}
