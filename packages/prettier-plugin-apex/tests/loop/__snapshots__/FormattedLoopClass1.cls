class LoopClass {
  void forLoop() {
    Integer count = 0;
    for (Integer i = 0; i < 10; i++)
      System.debug(i);

    for (count = 0; count < 10; count++) {
      System.debug(count);
    }
    for (
      count = 50000000 * 100000000;
      count < 1000000 * 3430000;
      count = count * 100000
    ) {
      System.debug(count);
    }
    for (;;) {
    }
    for (Integer i; i < 4; i++) {
      System.debug(i);
    }
    for (Integer i = 1, j = 10; i < 20 && j > 0; j = j - 1) {
      System.debug(j);
      System.debug('Hi');
      if (j == 5) {
        break;
      } else {
        continue;
      }
    }

    for (Integer i = 0; i < 10; i++) {
    }

    Contact[] contacts = new List<Contact> {};
    for (Contact a : contacts) {
      System.debug(a);
    }
    for (Contact a : contacts);
    for (;; voidCall());
    for (String s : stringSet);
  }

  void forSoql() {
    for (Contact a : [SELECT Id FROM Contact]) {
      System.debug(a);
    }
    for (Contact a : [
      SELECT Id
      FROM Contact
    ]) {
      System.debug(a);
    }
    for (Integer i = [SELECT COUNT() FROM Contact]; i < 0; i--) {
    }
    for (Contact a : [
      SELECT Id
      FROM Contact
      WHERE Name = 'Just Barely Out Of Space'
    ]) {
      System.debug(a);
    }
    for (Contact a : [
      SELECT Id
      FROM Contact
      WHERE Name = 'Just Barely Out Of Space'
    ]) {
      System.debug(a);
    }
    for (Contact a : [
      SELECT Id, Name, Description, Birthdate
      FROM Contact
      WHERE Id != NULL AND Name != 'Hello'
    ]) {
      System.debug(a);
    }
  }

  void forSosl() {
    for (SObject[] a : [FIND 'Hello' IN ALL FIELDS]) {
      System.debug(a);
    }
    for (SObject[] a : [
      FIND 'Hello'
      IN ALL FIELDS
    ]) {
      System.debug(a);
    }
    for (Integer i = [FIND 'Hello' IN ALL FIELDS]; i < 0; i--) {
    }
    for (SObject[] a : [
      FIND 'Just Barely Out Of Space For This Line'
      IN ALL FIELDS
    ]) {
      System.debug(a);
    }
    for (SObject[] a : [
      FIND 'Just Barely Out Of Space For This Line'
      IN ALL FIELDS
    ]) {
      System.debug(a);
    }
  }

  void whileLoop() {
    Integer i = 0;
    while (i < 10)
      i++;
    while (i < 10) {
      System.debug(i);
      i++;
      if (i == 5) {
        break;
      } else {
        continue;
      }
    }
    while (i < 5) {
    }

    while (
      i > 5000000 &&
      i < 34034034 &&
      i != 384294723 &&
      i != 47289347 &&
      i != 43249034
    ) {
      System.debug(i);
    }
    while (true) {
      break;
    }
    while (true);
  }

  void doWhileLoop() {
    Integer i = 0;
    do {
      System.debug(i);
      i++;
      if (i == 5) {
        break;
      } else {
        continue;
      }
    } while (count < 10);
    do {
    } while (count < 10);
    do {
    } while (
      i > 5000000 &&
      i < 34034034 &&
      i != 384294723 &&
      i != 47289347 &&
      i != 43249034
    );
  }
}
