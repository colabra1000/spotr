import 'package:c_modal/c_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:spotr/core/ui/textstyles.dart';
import 'package:spotr/features/main_app/presentation/bloc/settings_page/settings_page_bloc.dart';

class SettingsPageUiHelper {
  const SettingsPageUiHelper();
  SettingsPageUiHelper.resolveUIState({
    required SettingsPageState state,
    required CModalController modalController,
    required BuildContext context,
  }) {
    if (state is SettingsPageWorking) {
      modalController.changeModalState =
          CModalStateChanger(state: CModalState.loading);
    } else {
      modalController.dismissModal();
    }

    if (state is SettingsPageError) {
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

    if (state is SettingsPageAlert) {
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
