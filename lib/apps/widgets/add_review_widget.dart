import 'package:flutter/material.dart';
import 'package:resto/theme/color/color.dart';

// ignore: must_be_immutable
class TextFormReview extends StatelessWidget {
  late String label;
  late String hintText;

  TextInputType? textInputType;
  int? maxLine = 0;
  TextEditingController editingController = TextEditingController();
  TextFormReview(
    this.editingController, {
    Key? key,
    required this.label,
    required this.hintText,
    this.textInputType,
    this.maxLine,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: textInputType,
          maxLines: (maxLine != 0) ? 1 : null,
          controller: editingController,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorApp.greyColor,
              ),
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter some text';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
