import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final EdgeInsetsGeometry edg;
  final String? Function(String?) validator;
  final void Function(String) fun;
  final String label;
  final bool password;
  const Input(this.label, this.edg, this.fun, this.validator,
      {this.password = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edg,
      child: Column(
        children: [
          //Label
          Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),

          //Campo
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextFormField(
              obscureText: password,
              decoration: InputDecoration(
                hintText: label,
                fillColor: const Color(0xFFDCD7C9),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              onChanged: fun,
              // The validator receives the text that the user has entered.
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
