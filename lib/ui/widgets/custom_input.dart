import 'package:flutter/material.dart';

import '../../constants/app_borders.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_radiuses.dart';
import '../../extensions/date_time_extensions.dart';
import '../../extensions/num_extensions.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
    super.key,
    this.hint,
    this.label,
    this.prefix,
    this.isObsecure = false,
    this.suffix,
    this.isDisabled = false,
    this.controller,
    this.onTap,
    this.focus,
    this.onFieldSubmitted,
    this.validator,
  })  : title = null,
        isDate = false;

  const CustomInput.title({
    super.key,
    this.hint,
    this.label,
    this.prefix,
    this.isObsecure = false,
    this.suffix,
    this.title,
    this.isDisabled = false,
    this.controller,
    this.onTap,
    this.focus,
    this.onFieldSubmitted,
    this.validator,
  }) : isDate = false;

  const CustomInput.datePicker({
    super.key,
    this.hint = 'Select a date',
    this.label,
    this.prefix = Icons.date_range,
    this.isObsecure = false,
    this.suffix,
    this.title,
    this.isDisabled = true,
    this.isDate = true,
    required this.controller,
    this.onFieldSubmitted,
    this.validator,
  })  : onTap = null,
        focus = null;

  final String? hint;
  final String? label;
  final IconData? prefix;
  final bool isObsecure;
  final IconData? suffix;
  final String? title;
  final bool isDisabled;
  final TextEditingController? controller;
  final bool isDate;
  final void Function()? onTap;
  final FocusNode? focus;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool isVisible = false;
  DateTime selectedDate = DateTime.now();

  void changeVisibility() {
    isVisible = !isVisible;
    setState(() {});
  }

  void selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      widget.controller!.text = pickedDate.formattedDate;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(widget.title!),
          4.h,
        ],
        Opacity(
          opacity: !widget.isDisabled ? 1 : 0.6,
          child: TextFormField(
            focusNode: widget.focus,
            controller: widget.controller,
            obscureText: isVisible ? false : widget.isObsecure,
            onTap: widget.isDate ? () => selectDate() : widget.onTap,
            onFieldSubmitted: widget.onFieldSubmitted,
            validator: widget.validator,
            keyboardType: TextInputType.datetime,
            readOnly: widget.isDisabled,
            decoration: InputDecoration(
              border: AppBorders.inputBorder,
              enabledBorder: AppBorders.inputBorder,
              disabledBorder: AppBorders.inputBorder,
              focusedBorder: AppBorders.inputBorder,
              errorBorder: AppBorders.inputBorder.copyWith(
                borderSide: const BorderSide(color: AppColors.red),
              ),
              focusedErrorBorder: AppBorders.inputBorder.copyWith(
                borderSide: const BorderSide(color: AppColors.red),
              ),
              hintText: widget.hint,
              labelText: widget.label,
              prefixIcon: Icon(widget.prefix),
              suffixIcon: widget.isObsecure
                  ? InkWell(
                      borderRadius: AppRadiuses.a10,
                      onTap: () => changeVisibility(),
                      child: Icon(
                        !isVisible
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                      ),
                    )
                  : Icon(widget.suffix),
            ),
          ),
        ),
      ],
    );
  }
}
