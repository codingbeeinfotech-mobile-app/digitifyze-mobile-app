import 'dart:io';

String? validateEmail(String value) {
  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w- ]{2,4}$';
  final regExp = RegExp(pattern);
  if (value.isEmpty) {
    return "Please enter your email id";
  } else if (!regExp.hasMatch(value)) {
    return 'Email must be in a valid format';
  } else {
    return null;
  }
}
String? validatePassword(String value) {
  if (value.isEmpty) {
    return 'Please enter password';
  } else if (value.length < 6 || value.length > 30) {
    /*Password must be between 8–30 characters and non-empty*/
    return 'Password must be between 6–30 characters';
  } else {
    return null;
  }
}
String? validateConfirmPassword(String confirmpass, String pass) {
  if (confirmpass.isEmpty) {
    return 'Please Enter Confirm password';
  } else if (confirmpass.length < 6) {
    return 'Password must be at least 6 characters long';
  } else if (confirmpass != pass) {
    return 'Password must be same as above';
  } else {
    return null;
  }
}

String? validateLeadSource(String value) {
  if(value.isEmpty){
    return "Required";
  }else if(value == "0"){
    return "Required";
  }else{
    return null;
  }
}


String? validateDropDown(String value) {
  if(value.isEmpty){
    return "Required";
  }else{
    return null;
  }
}

String? validateDlNo(String value) {
  RegExp reg = RegExp(
      r"^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}" +
          r"|([a-zA-Z]{2}[0-9]{2}[\\/][a-zA-Z]{3}[\\/][0-9]{2}[\\/][0-9]{5})" +
          r"|([a-zA-Z]{2}[0-9]{2}(N)[\\-]{1}((19|20)[0-9][0-9])[\\-][0-9]{7})" +
          r"|([a-zA-Z]{2}[0-9]{14})" +
          r"|([a-zA-Z]{2}[\\-][0-9]{13})$");
  if (value.isEmpty) {
    return "DL Number can't be empty eg: MH-2020119876543";
  } else if (!reg.hasMatch(value)) {
    return 'Invalid Driving License Number';
  } else {
    return null;
  }
}

String? validateRcNo(String value) {
  RegExp reg = RegExp(
    r"^[A-Z]{2}\s?[0-9]{1,2}\s?[A-Z]{1,3}\s?[0-9]{4,5}$",
    caseSensitive: false,
  );
  if (value.isEmpty) {
    return "RC Number can't be empty eg:KA05CD56789";
  } else if (!reg.hasMatch(value)) {
    return 'Invalid RC Number';
  } else {
    return null;
  }
}

String? validateInfluencerReferralId(String value,{bool isInfluencer = false}) {
  if(value.isEmpty){
    return "Please enter ${isInfluencer ? "influencer" : "referral"} id";
  }else{
    return null;
  }
}

String? validateFirstName(String value) {
  if(value.isEmpty){
    return "Please enter your first name";
  }else{
    return null;
  }
}

String? validateEmptyField(String value) {
  if(value.isEmpty){
    return "empty field";
  }else{
    return null;
  }
}

String? validatePinCode(String value) {
  if (value.isEmpty) {
    return "Please enter a pin code.";
  } else if (!RegExp(r'^\d{6}$').hasMatch(value)) {
    return "PIN code must be exactly 6 digits.";
  }
  return null; // Valid input
}

String? validateLastName(String value) {
  if(value.isEmpty){
    return "Please enter your last name";
  }else{
    return null;
  }
}

String? validateFatherName(String value) {
  if(value.isEmpty){
    return "Please enter your father name";
  }else{
    return null;
  }
}

String? validateAddress(String value) {
  if(value.isEmpty){
    return "Please enter your address";
  }else{
    return null;
  }
}

String? validateUname(String value) {
  if (value.isEmpty) {
    return "Please Enter Your User Name";
  } else {
    return null;
  }
}

String? validateAadhaar(String value) {
  if (value.isEmpty) {
    return "Please enter your Aadhar Number.";
  } else if (!RegExp(r'^[2-9][0-9]{3} [0-9]{4} [0-9]{4}$').hasMatch(value)) {
    return "Please enter a valid 12-digit Aadhar Card Number.";
  }
  return null; // Input is valid
}

String? validate(String value) {
  if (value.isEmpty) {
    return "Required*";
  } else {
    return null;
  }
}
String? validateExpiryDate(String value) {
  if (value.isEmpty) {
    return "Required*";
  } else if (int.parse(value.split('/')[0]) > 12) {
    return "Month must be between 1 to 12";
  } else {
    return null;
  }
}

String? validatePhone(String value) {
  if (value.isEmpty) {
    return "Please enter your phone number";
  } else if (value.length < 10) {
    return "Phone number must be at least 10 digits long.";
  } else if (!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\/0-9]+$').hasMatch(value)) {
    return "Please enter a valid phone number.";
  }
  return null; // Valid phone number
}

String? validatePanNo(String value) {
  RegExp reg = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
  if (value.isEmpty) {
    return "Please enter your Pancard Number.";
  }else if (!reg.hasMatch(value.toUpperCase())) {
    return "Please enter a valid Pancard Number";
  }
  return null; // Valid phone number
}

String? validateIFSCCode(String value) {
  RegExp ifscRegex = RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$');
  if(value.isEmpty){
    return "Please enter your bank IFSC code.";
  }else if (!ifscRegex.hasMatch(value.toUpperCase())) {
  return "Please enter a valid IFSC code.";
  }
  return null;
}


String? validateImageFile(File? imageFile) {
  if (imageFile == null) {
    return "Please select an image.";
  }

  // Get file extension
  String fileExtension = imageFile.path.split('.').last.toLowerCase();

  // Allowed image extensions
  List<String> allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];

  if (!allowedExtensions.contains(fileExtension)) {
    return "Invalid image format. Please upload JPG, PNG, GIF, or WEBP.";
  }

  // Optional: Check file size (limit to 5MB)
  // int fileSizeInBytes = imageFile.lengthSync();
  // double fileSizeInMB = fileSizeInBytes / (1024 * 1024); // Convert to MB
  //
  // if (fileSizeInMB > 5) {
  //   return "Image size must be less than 5MB.";
  // }

  return null; // Image is valid
}


String? validateMultipleImages(List<File> imageFiles, {int minImages = 1, int maxImages = 6, double maxSizeMB = 5}) {
  // Check minimum image count
  if (imageFiles.isEmpty) {
    return "Please select at least $minImages image.";
  }

  // Check maximum image count
  if (imageFiles.length > maxImages) {
    return "You can only upload up to $maxImages images.";
  }

  // Allowed image formats
  List<String> allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];

  for (File imageFile in imageFiles) {
    String fileExtension = imageFile.path.split('.').last.toLowerCase();
    int fileSizeInBytes = imageFile.lengthSync();
    double fileSizeInMB = fileSizeInBytes / (1024 * 1024); // Convert to MB

    if (!allowedExtensions.contains(fileExtension)) {
      return "Invalid image format. Only JPG, PNG, GIF or WEBP are allowed.";
    }

    if (fileSizeInMB > maxSizeMB) {
      return "Each image must be less than $maxSizeMB MB.";
    }
  }

  return null; // All images are valid
}


// String? validatePhone(String value) {
//   if (value.isEmpty) {
//     return "Please Enter Your Phone No.";
//   } else if (!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\/0-9]+$')
//       .hasMatch(value)) {
//     return "Please Enter Valid Phone No.";
//   }
//   /*if (value.length != 10) {
//     return 'Phone No. must be at least 10 characters long';
//   }*/
//   else {
//     return null;
//   }
// }

String? validateZipCode(String value) {
  if (value.isEmpty) {
    return "Please Enter Your Zip Code";
  } else if (!RegExp(r'^[0-9]{5}(?:-[0-9]{4})?$').hasMatch(value)) {
    return "Please Enter Valid Zip Code";
  }
  return null;
}
