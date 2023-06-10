import 'package:flutter/material.dart';
import 'controller.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.states,
    required this.onPressed,
  }) : super(key: key);
  final ({ValueNotifier<bool> isLock, ValueNotifier<bool> isLoading}) states;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge([states.isLock, states.isLoading]),
        builder: (context, child) {
          return Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: states.isLock.value
                          ? null
                          : states.isLoading.value
                              ? null
                              : onPressed,
                      child: states.isLoading.value
                          ? const SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            )
                          : const Text(
                              'Entrar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            )),
                ),
              ),
            ],
          );
        });
  }
}
