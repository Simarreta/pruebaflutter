import '../views/views.dart';

class CustomInputField extends StatelessWidget {

  //VARIABLES
  final String hintText;
  final String label;
  final String? helperText;
  final IconData icono;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType? type;
  final bool obscureText;
  final String formProperty;
  final Map<String,String> formValues;


  const CustomInputField({
    Key? key,
    required this.hintText,
    required this.label,
    this.helperText,
    required this.icono,
    this.suffixIcon,
    this.prefixIcon,
    this.type,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: "",
      keyboardType: type,
      obscureText: obscureText,
      onChanged: (value)=> formValues[formProperty]=value,
      validator: (value) {
        if(value== ''|| value==null) return "Nop, no vas bien";
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(label),
        helperText: helperText,
        prefix: prefixIcon == null ? null: Icon(prefixIcon),
        suffix: suffixIcon == null ? null: Icon(suffixIcon),
        icon: Icon(icono),

      ),
    );
  }
}