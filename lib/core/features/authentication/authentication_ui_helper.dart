import 'package:c_modal/c_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../../ui/textstyles.dart';
import 'bloc/authentication_bloc.dart';

class AuthenticationUiHelper {
  const AuthenticationUiHelper();
  AuthenticationUiHelper.resolveUIState({
    required AuthenticationState state,
    required CModalController modalController,
    required BuildContext context,
  }) {
    if (state is AuthenticationIdleState) {
      modalController.dismissModal();
    }

    if (state is AuthenticationWorkingState) {
      modalController.changeModalState =
          CModalStateChanger(state: CModalState.loading);
    }

    if (state is AuthenticationErrorState) {
      showToast(state.errorMessage,
          position: StyledToastPosition.bottom,
          animation: StyledToastAnimation.slideFromBottom,
          context: context,
          fullWidth: true,
          duration: const Duration(seconds: 5),
          dismissOtherToast: true,
          textPadding: const EdgeInsets.symmetric(vertical: 20),
          backgroundColor: Colors.red.shade500.withOpacity(.9),
          textStyle: smallTextLight);
    }

    if (state is AuthenticationAlertState) {
      showToast(state.alertMessage,
          position: StyledToastPosition.bottom,
          animation: StyledToastAnimation.slideFromBottom,
          context: context,
          fullWidth: true,
          duration: const Duration(seconds: 5),
          dismissOtherToast: true,
          textPadding: const EdgeInsets.symmetric(vertical: 20),
          backgroundColor: Colors.green.shade500.withOpacity(.9),
          textStyle: smallTextLight);
    }
  }
}
