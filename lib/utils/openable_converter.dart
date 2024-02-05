bool openableFromJson(int? openable) {
  if (openable == 1) {
    return true;
  }
  return false;
}

int openableToJson(bool? isOpen) {
  if (isOpen == true) return 1;
  return 0;
}
