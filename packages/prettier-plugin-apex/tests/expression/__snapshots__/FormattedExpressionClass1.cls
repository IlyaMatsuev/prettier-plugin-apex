class Conditional extends Object {
  void assignmentExpression() {
    Integer i = 0;
    Integer j = 1;
    if (i = j) {
    }
    if (i &= j) {
    }
    if (i |= j) {
    }
    if (i ^= j) {
    }
    if (i += j) {
    }
    if (i -= j) {
    }
    if (i *= j) {
    }
    if (i /= j) {
    }
    if (i <<= j) {
    }
    if (i >>= j) {
    }
    if (i >>>= j) {
    }

    [
      SELECT Id
      FROM Contact
      WHERE Name = 'Super Long Name That Will Break On Its Own'
    ]
    .Name = 'Hello';
    [
      SELECT Id
      FROM Contact
      WHERE Name = 'Super Long Name That Will Break On Its Own'
    ]
    .size() - 1;
  }

  void ternaryExpression() {
    Integer a = 2;
    Integer b = 1;
    Integer c = a > b ? a : b;
    a < b ? System.debug('Hi') : System.debug('Hello');
  }

  void binaryExpression() {
    Integer i = 1;
    Integer j = 2;
    Integer a;

    a = i + j;
    a = i - j;
    a = i * j;
    a = i / j;
    a = i << j;
    a = i >> j;
    a = i >>> j;
    a = i ^ j;
    a = i & j;
    a = i | j;

    Integer result =
      oneRecord.get('Super Duper Long String That Will Break For Sure') + 1;
    Integer result =
      oneRecord.get('Super Duper Long String That Will Break For Sure') +
      anotherRecord.get(
        'Another Super Duper Long String That Will Break For Sure'
      );

    // Variable declaration
    String myString =
      'a long string ' +
      'from concatenating ' +
      'many other strings ' +
      'together.';

    // Assignment Statement
    myString =
      'a long string ' +
      'from concatenating ' +
      'many other strings ' +
      'together.';

    myVeryLongIntegerVariable =
      aVeryLongInteger +
      anotherVeryLongInteger * yetAnotherLongInterger -
      finallyThisVariable;

    UserWrapper user = new UsernameWrapper(
      foo.Active__c == true && foo.Status__c == 'Active'
    );
    user = new UsernameWrapper(
      foo.Very_Long_Property_Name_That_Will_Break__c == true &&
        foo.Status__c == 'Active'
    );
    user = UsernameWrapper.build(
      foo.Active__c == true && foo.Status__c == 'Active'
    );
    user = UsernameWrapper.build(
      foo.Very_Long_Property_Name_That_Will_Break__c == true &&
        foo.Status__c == 'Active'
    );

    return foo.Very_Long_Property_Name_That_Will_Break__c == true &&
      foo.Status__c == 'Active';
  }

  void castExpression() {
    String a;

    Id b = (Id) a;
    Schema.SObjectType sobjectType = ((Id) a).getSObjectType();
    VeryLongOuterClassName.VeryLongInnerClassName variableName = (VeryLongOuterClassName.VeryLongInnerClassName) JSON.deserialize(
      anotherVariableName.Very_Long_Property_Meber__c,
      VeryLongOuterClassName.VeryLongInnerClassName.class
    );
    VeryLongOuterClassName.VeryLongInnerClassName variableName = (VeryLongOuterClassName.VeryLongInnerClassName) JSON.deserialize(
      anotherVariableName.Very_Long_Property_Meber__c,
      VeryLongOuterClassName.VeryLongInnerClassName.class
    );
  }

  void instanceOfExpression() {
    SObject o;
    Boolean b = o instanceof Account;
    Boolean b = veryLongVariableNameThatWillForSureOneHundredPercentBreak.getMethod()
      .getSObject() instanceof Account;
  }

  void booleanExpression() {
    Boolean a = true;
    Boolean b = false;
    Boolean c;

    c = a == b;
    c = a === b;
    c = a !== b;
    c = a != b;
    c = a <> b;
    c = a < b;
    c = a > b;
    c = a <= b;
    c = a >= b;
    c = a && b;
    c = a || b;

    Boolean hasPrivateReports =
      (Integer) ([
          SELECT COUNT(Id) num
          FROM Report
          WHERE OwnerId = :UserInfo.getUserId()
        ])
        .get(0)
        .get('num') > 0;
    Boolean hasPrivateReports =
      (Integer) ([
          SELECT COUNT(Id) num
          FROM Report
          WHERE OwnerId = :UserInfo.getUserId()
        ])
        .get(0)
        .get('num') > 0 &&
      (Integer) ([
          SELECT COUNT(Id) num
          FROM Report
          WHERE OwnerId = :UserInfo.getUserId()
        ])
        .get(0)
        .get('num') > 0;
    Boolean result =
      oneRecord.get('Super Duper Long String That Will Break For Sure') > 1;
    Boolean result =
      oneRecord.get('Super Duper Long String That Will Break For Sure') >
      anotherRecord.get(
        'Another Super Duper Long String That Will Break For Sure'
      );
    Boolean result =
      oneRecord.get(
          'Super Duper Long String That Will Break For Sure And Make This Line Go Very Long'
        )
        .get('Yet Another Very Long Variable To Help Breaking') >
      anotherRecord.get(
          'Another Super Duper Long String That Will Break For Sure And Make This Line Go Very Long'
        )
        .get('Yet Another Variable To Help Breaking');

    Boolean myVeryLongBooleanVariable =
      anExtremelyVeryLongVariable >
      anotherVeryLongVariable >
      yetAnotherVeryLongVariable;

    myVeryLongBooleanVariable =
      anExtremelyVeryLongVariable > anotherVeryLongVariable &&
      yetAnotherVeryLongVariable;

    Boolean veryLongBoolean =
      i > 5000000 &&
      i < 34034034 &&
      i != 384294723 &&
      i != 47289347 &&
      i != 43249034;

    Boolean c;
    c =
      myObj.Lead__r != null &&
      myObj.Lead__r.IsConverted &&
      someOtherCheck &&
      yetAnotherVeryVeryVeryVeryLongCheckThatWillBreak;
    c =
      myObj.Lead__r != null &&
      !myObj.Lead__r.IsConverted &&
      someOtherCheck &&
      yetAnotherVeryVeryVeryVeryLongCheckThatWillBreak;

    // This is different than what you'd expect. jorje does not automatically
    // group this as left(anExtremelyVeryLongVariable > anotherVeryLongVariable)
    // and right (anExtremelyVeryLongVariable < anotherVeryLongVariable).
    // Instead it is
    // left (anExtremelyVeryLongVariable > anotherVeryLongVariable == anExtremelyVeryLongVariable)
    // and right (anotherVeryLongVariable).
    // Therefore the formatted code does not look as nice as Prettier's core,
    // but we can't change it because it will change the code's behavior.
    myVeryLongBooleanVariable =
      anExtremelyVeryLongVariable >
      anotherVeryLongVariable ==
      anExtremelyVeryLongVariable <
      anotherVeryLongVariable;

    myVeryLongBooleanVariable =
      (anExtremelyVeryLongVariable > anotherVeryLongVariable) ==
      (anExtremelyVeryLongVariable < anotherVeryLongVariable);

    Boolean b =
      [
        SELECT Id
        FROM Contact
        WHERE Name = 'Super Long Name That Will Break On Its Own'
      ]
      .Id != null;
    Boolean b =
      [
        SELECT Id
        FROM Contact
        WHERE Name = 'Super Long Name That Will Break On Its Own'
      ][0]
      .Id != null;
  }

  void triggerVariableExpr_inOtherSuite() {
  }

  void packageVersionExpression() {
    Package.Version.Request;
  }

  void prefixExpression() {
    Integer a = 1;
    Integer b;

    b = +a;
    b = -a;
    b = !a;
    b = ~a;
    b = ++a;
    b = --a;
  }

  void postfixExpression() {
    Integer a = 1;
    Integer b;

    b = a++;
    b = a--;
  }

  void arrayExpression() {
    Integer[] a = new List<Integer> { 1, 2, 3, 4 };
    Integer b;
    Integer veryLongNumberThatMayExceedsTheLongestLineOwnItsOwnWithoutAnythingElseInTheWay = 1;

    b = a[0];
    b = a[a[0]];
    b = a[
      a[
        veryLongNumberThatMayExceedsTheLongestLineOwnItsOwnWithoutAnythingElseInTheWay
      ]
    ];
    VeryLongOuterClassName.VeryLongInnerClassName variableName = controller.systemStatusOptions[0];
    VeryLongOuterClassName.VeryLongInnerClassName variableName = controller.propertyMember.systemStatusOptions[
      veryLongVariableThatWillBreakForSureWithoutAnyOtherElementAffectingIt
    ];
    VeryLongOuterClassName.VeryLongInnerClassName variableName = controller
      .propertyMember.systemStatusOptions[
        a[
          a[
            veryLongNumberThatMayExceedsTheLongestLineOwnItsOwnWithoutAnythingElseInTheWay
          ]
        ]
      ];
    b = a.b.c[
      veryLongNumberThatMayExceedsTheLongestLineOwnItsOwnWithoutAnythingElseInTheWay
    ];

    VeryLongOuterClassName.VeryLongInnerClassName variableName = controller.systemStatusOptions()[0];
    VeryLongOuterClassName.VeryLongInnerClassName variableName = controller.propertyMember.systemStatusOptions()[
      veryLongVariableThatWillBreakForSureWithoutAnyOtherElementAffectingIt
    ];
    VeryLongOuterClassName.VeryLongInnerClassName variableName = controller
      .propertyMember.systemStatusOptions()[
        a[
          a[
            veryLongNumberThatMayExceedsTheLongestLineOwnItsOwnWithoutAnythingElseInTheWay
          ]
        ]
      ];
    b = a.b.c()[
      veryLongNumberThatMayExceedsTheLongestLineOwnItsOwnWithoutAnythingElseInTheWay
    ];

    b = 'String Literal'[0];
    b = 'Very Long String Literal That Will Break The Line For Sure Without Help From Any Other Element'[0];

    String longResult = o[0].callMethod('first param');
    String longResult = o[0]
      .callMethod('first param', 'second param', 'third param', 'fourth param');
    String longResult = o[
        veryLongNumberThatMayExceedsTheLongestLineOwnItsOwnWithoutAnythingElseInTheWay
      ]
      .callMethod('first param');
    String longResult = o[0]
      .callMethod('first param')
      .callAnotherMethod()
      .getStringResult();
  }

  void variableExpression() {
    Integer a = 1;
    Integer b = 2;
    Integer c = a + b;
    longVariableName.Very_Long_SObject_Field_Name__c = longVariableName.Another_Very_Long_SObject_Field_Name__c;
    longVariableName.Very_Long_SObject_Field_Name__c = longVariableName.getSObjectFields()
      .Another_Very_Long_SObject_Field_Name__c;
    longVariableName.veryLongVariableNameThatShouldNotBeBroken = veryLongVariableName.handleSomeMethod();
    longVariableName.veryLongVariableNameThatShouldNotBeBroken.anotherSubVariable = veryLongVariableName.handleSomeMethod();
  }

  void methodCallExpression() {
    SomeObject o = new SomeObject();
    String result = o.callMethod().getStringResult();
    String longResult = o.callMethod('first param')
      .callAnotherMethod()
      .getStringResult();
    String longResult = this.callMethod(
      'first param',
      'second param',
      'thirdParam',
      'forthParam'
    );
    String longResult = super.callMethod(
      'first param',
      'second param',
      'thirdParam',
      'forthParam'
    );
    String longResult = o.callMethod(
      'first param',
      'second param',
      'thirdParam',
      'forthParam'
    );
    String longResult = o.callMethod(
        'first param',
        'second param',
        'thirdParam'
      )
      .callAnotherMethod()
      .getStringResult();
    String longResult = o.callMethod(
      'first param',
      'second param',
      'thirdParam',
      'fourthParam',
      'fifthParam',
      'sixthParam'
    );
    String longResult = o.callMethod(
        'first param',
        'second param',
        'thirdParam',
        'fourthParam',
        'fifthParam',
        'sixthParam'
      )
      .callAnotherMethod()
      .getStringResult();
    String longResult = o.callAnotherMethod()
      .getStringResult()
      .callMethod(
        'first param',
        'second param',
        'thirdParam',
        'fourthParam',
        'fifthParam',
        'sixthParam'
      );
    controller.callMethod(
      'A Super Long String That Will Break The Outer Parent And Lead To Complicated Result'
    );

    VeryLongOuterClassName.VeryLongInnerClassName variableName = anotherVariable.veryLongPropertyMember.get(
      accountId
    );
    VeryLongOuterClassName.VeryLongInnerClassName variableName = anotherVariable
      .veryLongPropertyMember
      .get(accountId);
    VeryLongOuterClassName.VeryLongInnerClassName variableName = controller.systemStatusOptions[0]
      .getValue();
    variableName.propertyName.add(
      new InnerClass(
        objectBuilder
          .callMethod()
          .callAnotherMethod(null)
          .callYetAnotherMethod('Hello')
          .callYetAnotherYetAnotherMethod(Date.today())
      )
    );
    variableName.propertyMember.get('Name')
      .status = variableName.propertyOptions[0].getValue();
    a = b.c()
      .d(
        'first param',
        'second param',
        'thirdParam',
        'fourthParam',
        'fifthParam',
        'sixthParam'
      );
    VeryLongOuterClassName.VeryLongInnerClassName variableName = superDuperLongVariableNameThatWillBreakForSure.deserialize(
      anotherVariableName.Very_Long_Property_Member__c,
      VeryLongOuterClassName.VeryLongInnerClassName.class
    );
    VeryLongOuterClassName.VeryLongInnerClassName variableName = superDuperLongVariableNameThatWillBreakForSure
      .deserialize(
        anotherVariableName.Very_Long_Property_Member__c,
        VeryLongOuterClassName.VeryLongInnerClassName.class
      );
    VeryLongOuterClassName.VeryLongInnerClassName variableName = superDuperLongVariableNameThatIsAMethodThatWillBreakForSure(
      anotherVariableName.Very_Long_Property_Member__c,
      VeryLongOuterClassName.VeryLongInnerClassName.class
    );

    VeryLongOuterClassName.VeryLongInnerClassName variableName = [
        SELECT Id
        FROM Account
      ]
      .callMethod();
    VeryLongOuterClassName.VeryLongInnerClassName variableName = [
        SELECT Id
        FROM Account
      ]
      .callMethod()
      .callAnotherMethod(
        'first param',
        'second param',
        'thirdParam',
        'fourthParam',
        'fifthParam',
        'sixthParam'
      );

    Boolean b =
      [
        SELECT Id
        FROM Contact
        WHERE Name = 'Super Long Name That Will Break On Its Own'
      ]
      .size() > 0;
    Boolean b =
      [
        SELECT Id
        FROM Contact
        WHERE Name = 'Super Long Name That Will Break On Its Own'
      ][0]
      .size() > 0;
  }

  void javaMethodCallExpression_notNeeded() {
  }

  void javaVariableExpression_notNeeded() {
  }

  void superVariableExpression() {
    super.methodCall();
    super.methodCall(1, 2, 3);

    // Super cannot be followed by any whitespace, so we can't add newlines after it
    // even if the chain is very long
    String longResult = super.callMethod('first param')
      .callAnotherMethod()
      .getStringResult();
    String longResult = super.longPropertyName.anotherLongPropertyName.yetAnotherLongPropertyName;
    String longResult = super.longPropertyName.callMethod('first param')
      .callAnotherMethod()
      .getStringResult();
  }

  void thisVariableExpression() {
    this.a = 'Hello World';
    this.veryLongVariableNameThatShouldNotBeBroken = veryLongVariableName.handleSomeMethod();
    this.veryLongVariableNameThatShouldNotBeBroken.anotherSubVariable = veryLongVariableName.handleSomeMethod();
    System.debug(this.a + this.b);
  }

  void longStaticMethodCallChainExpression() {
    Map<String, Schema.RecordTypeInfo> accRTs = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName();
    Blob yetAnotherVeryLongVariableThatWillSurelyBreakTheLineOnItsOwn = Blob.valueOf(
        ''
      )
      .size();
  }

  void classRefExpression() {
    System.Type t = Integer.class;
  }

  void literalExpression() {
    String a = 'Hello';
    Integer b = 1;
    Long c = 2147483648L;
    Double d = 0.1d;
    Decimal e = 2.14;
    Boolean f = true;
    Boolean g = false;
    Object h = null;
  }

  void dottedExprMethod() {
    a.Field__c = null;
    a.Field__c = null;
    longVariableName.Very_Long_SObject_Field_Name__c = longVariableName.Another_Very_Long_SObject_Field_Name__c;
    longVariableName.Very_Long_SObject_Field_Name__c = longVariableName
      .Another_Very_Long_SObject_Field_Name__c;
    CustomObject__c customObject = generator.objectBuilder.setExternalId(
        account.personContactId
      )
      .getInstance();
    CustomObject__c customObject = generator.objectBuilder
      .setExternalId(account.personContactId)
      .getInstance();
    customObject = generator.objectBuilder.setExternalId(
        account.personContactId
      )
      .Name.toString()
      .Name.Name.toString();
  }

  void soqlExpression_inOtherSuite() {
  }

  void soslExpression_inOtherSuite() {
  }

  class InnerClass extends ExpressionClass {
    InnerClass() {
      // ThisMethodCallExpression
      this(1);
    }

    InnerClass(Integer i) {
      // SuperMethodCallExpression
      super(i);
    }
  }
}
