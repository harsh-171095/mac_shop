enum ValidationType {
  email,
  name,
  productName,
  productBrand,
  productContent,
  contentMass
}

class Validation {
  static bool isRequired(String value, {bool allowEmptySpaces = true}) {
    if (value == null || value.isEmpty) {
      return false;
    } else {
      if (!allowEmptySpaces) {
        // Check if the string is not only made of empty spaces
        if (RegExp(r"\s").hasMatch(value)) {
          return false;
        }
      }
      return true; // passed
    }
  }
  ValidationInfo getValidation(ValidationType type, String text) {
    switch (type) {
      case ValidationType.email:
        return _email(text);
      case ValidationType.name:
        return _name(text);
      case ValidationType.productName:
        return _productName(text);
      case ValidationType.productBrand:
        return _productBrand(text);
      case ValidationType.productContent:
        return _productContent(text);
      case ValidationType.contentMass:
        return _contentMass(text);
    }
  }

  ValidationInfo _email(String text) {
    if (text.isEmpty) {
      return ValidationInfo(message: "Please enter email", status: false);
    } else {
      return ValidationInfo(message: "", status: true);
    }
  }

  ValidationInfo _name(String text) {
    if (text.isEmpty) {
      return ValidationInfo(message: "Please enter name", status: false);
    } else {
      return ValidationInfo(message: "", status: true);
    }
  }

  ValidationInfo _productName(String text) {
    if (text.isEmpty) {
      return ValidationInfo(
          message: "Please enter product name", status: false);
    } else {
      return ValidationInfo(message: "", status: true);
    }
  }

  ValidationInfo _productBrand(String text) {
    if (text.isEmpty) {
      return ValidationInfo(
          message: "Please enter product brand", status: false);
    } else {
      return ValidationInfo(message: "", status: true);
    }
  }

  ValidationInfo _productContent(String text) {
    if (text.isEmpty) {
      return ValidationInfo(
          message: "Please enter product content", status: false);
    } else {
      return ValidationInfo(message: "", status: true);
    }
  }

  ValidationInfo _contentMass(String text) {
    if (text.isEmpty) {
      return ValidationInfo(message: "Please enter mass", status: false);
    } else {
      return ValidationInfo(message: "", status: true);
    }
  }
}

class ValidationInfo {
  final bool status;
  final String message;

  ValidationInfo({required this.message, required this.status});
}
