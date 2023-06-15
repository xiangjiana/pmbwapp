const _validProtocol = ['OMIN', 'ERC20', 'TRC20'];

class ProtocolAddressValidator {
  static bool isValid(String protocolType, String address) {
    if (!_validProtocol.contains(protocolType)) throw InvalidException();
    if (protocolType == 'ERC20' && !address.startsWith('0x')) {
      throw InvalidException();
    }
    if (protocolType == 'OMIN' &&
        !(address.startsWith('1') || address.startsWith('3'))) {
      throw InvalidException();
    }
    if (protocolType == 'TRC20' && !address.startsWith('T')) {
      throw InvalidException();
    }
    return true;
  }
}

class InvalidException implements Exception {}
