import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/main_cubit/main_cubit.dart';

class GenderField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Row(
          children: [
            const Text(
              "Gender: ", style: TextStyle(fontWeight: FontWeight.bold),),
            Radio(
                value: "male",
                groupValue: cubit.selectedGender,
                onChanged: (value) {
                  cubit.changeGender(value.toString());
                }),
            const Text("Male"),
            Radio(
                value: "female",
                groupValue: cubit.selectedGender,
                onChanged: (value) {
                  cubit.changeGender(value.toString());
                }),
            const Text("Female"),
          ],
        );
      },
    );
  }
}
