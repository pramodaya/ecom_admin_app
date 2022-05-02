import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../authantication/authantication_iew_model/authantication_service.dart';

class CompleteProfileViewModel {
  void addUser(BuildContext context, String firstName, String lastName,
      String phone, String address) async {
    context
        .read<AuthanticationService>()
        .completeProfile(
          context,
          firstName,
          lastName,
          phone,
          address
        );
  }
}
