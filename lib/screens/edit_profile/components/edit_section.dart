import 'package:flutter/material.dart';
import 'package:letsblog_flutter/components/input_fields.dart';
import 'package:letsblog_flutter/screens/edit_profile/components/section_header.dart';
import 'package:letsblog_flutter/utils.dart';

class EditSection extends StatefulWidget {
  const EditSection(
      {Key? key, required this.title, required this.profileControllers})
      : super(key: key);

  final String title;
  final Map profileControllers;
  @override
  State<EditSection> createState() => _EditSectionState();
}

class _EditSectionState extends State<EditSection> {
  bool showSection = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          // Section Header
          SectionHeader(
            title: widget.title,
            showProfileSection: showSection,
            press: () => setState(() => showSection = !showSection),
          ),
          // Section Body
          showSection == true
              ? Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: widget.profileControllers.keys
                        .map((key) => CustomInputField(
                              title: capitalize(key),
                              inputController: widget.profileControllers[key][0],
                              maxCharacters: widget.profileControllers[key][1],
                              minLines: key == 'bio' ? 8 : 1,
                              maxLines: key == 'bio' ? 12 : 1,
                              // maxCharacters: null,
                            ))
                        .toList(),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
