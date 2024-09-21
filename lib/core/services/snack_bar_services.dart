import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SnackBarService {
  static void showSuccessMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: msg.length > 80 ? 100 + 75 : 100,
            padding: const EdgeInsets.only(right: 8),
            margin: const EdgeInsets.only(left: 24, right: 24),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(12),
            ),
            child: msg.length > 80
                ? Row(
                    children: [
                      Container(
                        height: double.infinity,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xFF6AE634), // Green for success
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          msg,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      msg,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
          ),
        );
      },
    );
  }

  static void showErrorMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: msg.length > 80 ? 100 + 75 : 100,
            padding: const EdgeInsets.only(right: 8),
            margin: const EdgeInsets.only(left: 24, right: 24),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(12),
            ),
            child: msg.length > 80
                ? Row(
                    children: [
                      Container(
                        height: double.infinity,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Colors.red, // Red for error
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          msg,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      msg,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
