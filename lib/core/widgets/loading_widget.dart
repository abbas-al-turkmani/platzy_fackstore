import 'package:platzy_fackstore/core/network/failuer.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.isLoading,
    required this.errorMessage,
    required this.child,
  });

  final bool isLoading;
  final Failuer errorMessage;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : errorMessage.isEmpty()
            ? child
            : Center(
                child: Text(
                  errorMessage.error,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
  }
}
