class Validations {
  static bool isEmailValid(String? email) {
    final RegExp regex = RegExp(
        r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$");
    return regex.hasMatch(email ?? '');
  }

  static bool isValidDate(String dateInput, bool isFuture) {
    try {
      var split = dateInput.split(' ');
      var inputSplitDate = split[0].split('/');
      String hour = split.length > 1 ? split[1] : '';
      String dateString =
          '${inputSplitDate[2]}-${inputSplitDate[1]}-${inputSplitDate[0]} $hour';
      var date = DateTime.parse(dateString.trim());
      if (dateInput.length < 10) {
        return false;
      } else if (!isFuture && date.compareTo(DateTime.now()) == 1) {
        return false;
      } else if (isFuture && date.compareTo(DateTime.now()) == -1) {
        return false;
      } else if (date.compareTo(DateTime(1753, 1, 1)) == -1) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    phoneNumber =
        phoneNumber.replaceAll("-", "").replaceAll("(", "").replaceAll(")", "");
    int? intPhoneNumber = int.tryParse(phoneNumber);
    if (intPhoneNumber == null) {
      return false;
    }
    if (phoneNumber.length != 11) {
      return false;
    }
    return true;
  }

  static bool isValidCPF(String cpf) {
    cpf = cpf.replaceAll(RegExp(r'[^\d]'), '');

    if (cpf.length != 11) {
      return false;
    }

    int primeiroDV = calcularDV(cpf, 10);

    int segundoDV = calcularDV(cpf, 11);

    if (primeiroDV != int.parse(cpf[9]) || segundoDV != int.parse(cpf[10])) {
      return false;
    }

    return true;
  }

  static int calcularDV(String cpf, int pesoMaximo) {
    int soma = 0;
    int peso = pesoMaximo;

    for (int i = 0; i < cpf.length - 2; i++) {
      soma += int.parse(cpf[i]) * peso;
      peso--;
    }

    soma = soma % 11;

    if (soma < 10) {
      return soma;
    } else {
      return 0;
    }
  }
}
