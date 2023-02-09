import 'package:flutter/material.dart';

class TextfieldWidgets {
  Widget textfieldWidgets(
      {String? labelText,
      var validator,
      TextInputType? keyboardType,
      bool? password,
      TextEditingController? controller}) {
    return Container(
        padding: const EdgeInsets.all(4),
        child: TextFormField(
          controller: controller,
          style: TextStyle(color: Colors.white),
          keyboardType:
              keyboardType != null ? keyboardType : TextInputType.name,
          validator: validator,
          obscureText: password ?? false,
          //  (value) {
          //   if (value == null || value.isEmpty) {
          //     return 'Please enter your user name.';
          //   } else if (value.contains('@')) {
          //     return 'Please don\'t use the @ char.';
          //   }
          //   return null;
          // },
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.9))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.5))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.5))),
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            labelStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            labelText: labelText ?? "",
          ),
        ));
  }

  Widget businessTextfieldWidgets({
    String? labelText,
    var validator,
    TextEditingController? controller,
    TextInputType? keyboardType,
  }) {
    return Container(
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
        height: 50,
        child: TextFormField(
          keyboardType: keyboardType ?? TextInputType.name,
          controller: controller,
          validator: validator,
          style: TextStyle(color: Color(0xFF655E5E)),
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.white)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.white)),
            filled: true,
            fillColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: const TextStyle(
              color: Color(0xFF655E5E),
              fontSize: 16,
            ),
            labelText: labelText ?? "",
          ),
        ));
  }
}

class CustomBoxShadow extends BoxShadow {
  final BlurStyle blurStyle;

  const CustomBoxShadow({
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    this.blurStyle = BlurStyle.normal,
  }) : super(color: color, offset: offset, blurRadius: blurRadius);

  @override
  Paint toPaint() {
    final Paint result = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(this.blurStyle, blurSigma);
    assert(() {
      if (debugDisableShadows) result.maskFilter = null;
      return true;
    }());
    return result;
  }
}
