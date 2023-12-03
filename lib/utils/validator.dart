
/// Class of validation functions that the app will use
///   - This class should be used as a mixin using the `with` keyword
class Validators {
  final phoneNumberRegExp = RegExp(
    r'^\d{3}-\d{3}-\d{4}$',
  );
  final emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
  );

  final vinExp = RegExp(r'^[A-HJ-NPR-Z0-9{17}$]');
  final dateRegExp = RegExp(r'^\d{2}/\d{2}/\d{4}$');
  final zipCodeRegExp = RegExp(r'^[0-9]{5}(?:-[0-9]{4})?$');
  final mustContainCapital = RegExp('^(?=.*?[A-Z])');
  final mustContainNumber = RegExp('^(?=.*?[0-9])');
  final mustContainCharacter = RegExp(r'^(?=.*?[#?!@$%^&*-])');

  String? validateEmail(String? value) {
    if (value!.trim().isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegExp.hasMatch(value.trim())) {
      return 'Email is invalid';
    }
    return null;
  }



   String? validatesPhoneNumber(String value) {
    if (value.isEmpty) {
      return 'empty Text Field';
    }
    if (!RegExp(r'^\d+?$').hasMatch(value) ||
        (value.startsWith("01") && value.length != 11) ||
        (value.length < 10)) {
      return 'invalid Phone Number Field';
    }
    return null;
  }

  // String? validatePhoneNumberOrEmail(String? value) {
  //   if (value!.trim().isEmpty) {
  //     return ' Please $enterEmailOrPhone';
  //   }
  //   return null;
  // }

  String? validateZip(String? value) {
    if (value!.trim().isEmpty) {
      return 'Zip code cannot be empty';
    } else if (!zipCodeRegExp.hasMatch(value.trim())) {
      return 'Zip code is invalid';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password is too short';
    } else if (!mustContainCapital.hasMatch(value.trim())) {
      return 'Password must contain at least one upper case';
    } else if (!mustContainNumber.hasMatch(value.trim())) {
      return 'Password must contain at least one digit';
    } else if (!mustContainCharacter.hasMatch(value.trim())) {
      return 'at least one special character';
    }
    return null;
  }

  String? validateVIM(String? value) {
    if (!vinExp.hasMatch(value!.trim())) {
      return 'Invalid VIN';
    } else if(value.trim().length != 17) {
      return 'VIN must contain 17 characters';
      // ZPBUA1ZL9KLA01848
    }
    return null;
  }

  String? validateNewPassword(String? value, String? newValue) {
    if (value!.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password is too short';
    } else if (!mustContainCapital.hasMatch(value.trim())) {
      return 'Password must contain at least one upper case';
    } else if (!mustContainNumber.hasMatch(value.trim())) {
      return 'Password must contain at least one digit';
    } else if (!mustContainCharacter.hasMatch(value.trim())) {
      return 'at least one special character';
    } else if (value.trim() == (newValue ?? '').trim()) {
      return 'New password cannot be the same as old';
    }
    return null;
  }

  String? validatePin(String? value) {
    if (value!.trim().isEmpty) {
      return 'Pin cannot be empty';
    } else if (!mustContainNumber.hasMatch(value.trim())) {
      return 'Pin must be 4 digit';
    } else if (value.length > 4) {
      return 'pin cannot be more than 4 digits';
    }
    return null;
  }

  String? confirmPin(String? value, String? newValue) {
    if (value!.trim() != (newValue ?? '').trim()) {
      return 'pin does not match';
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String? newValue) {
    if (value!.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password is too short';
    } else if (value.trim() != (newValue ?? '').trim()) {
      return 'Password does not match';
    }
    return null;
  }

  String? validateEmptyTextField(String? value) {
    if (value!.trim().isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }


  String? validateShippingAdrress({
    String? street,
    String? city,
    String? state,
    String? postCode,
  }) {
    if (street!.trim() == '' || city == '' || state == '' || postCode == '') {
      return 'Invalid Address, please select a valid address';
    }
    return null;
  }

  String? validateDate(String? value) {
    if (value!.trim().isEmpty) {
      return 'Date cannot be empty';
    } else if (!dateRegExp.hasMatch(value.trim())) {
      return 'Date is invalid.\nFormat: 10/05/2015(DD/MM/YYYY)';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value!.trim().isEmpty) {
      return 'This field cannot be empty';
    } else if (value.contains(' ')) {
      return 'This field cannot contain blank spaces';
    } else if (RegExp(r'[!@#,.<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
      return 'This field can only contains alphabets';
    }
    return null;
  }

  String? validateUserName(String? value) {
    if (value!.trim().isEmpty) {
      return 'This field cannot be empty';
    } else if (value.contains(' ')) {
      return 'This field cannot contain blank spaces';
    } else if (value.length <= 4) {
      return 'Username too small';
    }
    return null;
  }

  String? validateReferralCode(String? value) {
    if (value!.trim().isEmpty) {
      return 'Referral code is required';
    } else if (value.length <= 7) {
      return 'Invalid referral code';
    }
    return null;
  }
}

/// validation for cards visa or master