//Leading Inline Comment

/*   leading Block Comment */ /*another Leading Block Comment      */

/**
 * ApexDoc for class
 */
@isTest(
 seeAllData = true      //class annotation inline comment 1
 //isParallel = false         // class annotation inline comment 2
)
class Comments {
  // Dangling class inline comment

  /* Dangling class block comment */

  /**
   * ApexDoc for method
   */
  void assignmentComments() {
    Integer a /* comment */ = 1;
    Integer b // comment
      = 1;

    Integer a = 1; // Trailing Comment 1
    Integer b = 2;
  }

  void initMultiComments() {
    List<Integer> dayList;
    Set<Integer> daySet;
    Map<Integer, Integer> dayMap;
    dayList = new list<Integer> {
      0,  // Sunday
      1,  // Monday
      2,  // Tuesday
      3,  // Wednesday
      4,  // Thursday
      5,  // Friday
      6  // Saturday
    }; // Final list trailing inline comment

    dayList = new list<Integer> {
      0,  /* Sunday */
      1,  /* Monday */
      2,  /* Tuesday */
      3,  /* Wednesday */
      4,  /* Thursday */
      5,  /* Friday */
      6  /* Saturday */
    }; /* Final list trailing block comment */

    daySet = new Set<Integer> {
      0,  // Sunday
      1,  // Monday
      2,  // Tuesday
      3,  // Wednesday
      4,  // Thursday
      5,  // Friday
      6  // Saturday
    }; // Final set trailing inline comment

    daySet = new Set<Integer> {
      0,  /* Sunday */
      1,  /* Monday */
      2,  /* Tuesday */
      3,  /* Wednesday */
      4,  /* Thursday */
      5,  /* Friday */
      6  /* Saturday */
    }; /* Final set trailing block comment */

    dayMap = new Map<Integer> {
      0 => 0,  // Sunday
      1 => 1,  // Monday
      2 => 2,  // Tuesday
      3 => 3,  // Wednesday
      4 => 4,  // Thursday
      5 => 5,  // Friday
      6 => 6 // Saturday
    }; // Final map trailing inline comment

    dayMap = new Map<Integer, Integer> {
      0 => 0,  /* Sunday */
      1 => 1,  /* Monday */
      2 => 2,  /* Tuesday */
      3 => 3,  /* Wednesday */
      4 => 4,  /* Thursday */
      5 => 5,  /* Friday */
      6 => 6 /* Saturday */
    }; /* Final map trailing block comment */

    TestBatch batch = new TestBatch(
      TestBatch.UPDATE_OPP_REC_TYPE_QUERY, // test 1
      TestBatch.UPDATE_OPP_REC_TYPE, // test 2
      ids, // test 3
      lastVariable // test 4
    );
  }

  void longChainComments() {
    String a;
    a = new StringBuilder()
      .append('The quick brown fox')
      // Method chain inline comment 1
      .append(' jumps over the lazy dog')
      .toString();

    a = new StringBuilder()
      .append('The quick brown fox')
      .append(' jumps over the lazy dog')
      // Method chain inline comment 2
      .toString();

    a = new StringBuilder()
      .append('The quick brown fox')
      .append(' jumps over the lazy dog')
      .b
      // Method chain inline comment 3
      .toString();

    a = new StringBuilder()
      .append('The quick brown fox')
      .append(' jumps over the lazy dog')
      // Method chain inline comment 4
      .b
      .toString();

    a = new StringBuilder()
      .append('The quick brown fox')
      .append(' jumps over the lazy dog')
      .b
      // Method chain inline comment 5
      .c
      .toString();

    a = new StringBuilder()
      .append('The quick brown fox')
      .append(' jumps over the lazy dog')
      // Method chain inline comment 6
      .b
      .c
      .toString();

    a = new StringBuilder()
      .append('The quick brown fox')
      /* Method chain block comment 1 */
      .append(' jumps over the lazy dog')
      .toString();

    a = new StringBuilder()
      .append('The quick brown fox')
      .append(' jumps over the lazy dog')
      /* Method chain block comment 2 */
      .toString();

    a = new StringBuilder()
      .append('The quick brown fox')
      .append(' jumps over the lazy dog')
      .b
      /* Method chain block comment 3 */
      .toString();

    a = new StringBuilder()
      .append('The quick brown fox')
      .append(' jumps over the lazy dog')
      /* Method chain block comment 4 */
      .b
      .toString();

    a = new StringBuilder()
      .append('The quick brown fox')
      .append(' jumps over the lazy dog')
      .b
      /* Method chain block comment 5 */
      .c
      .toString();

    a = new StringBuilder()
      .append('The quick brown fox')
      .append(' jumps over the lazy dog')
      /* Method chain block comment 6 */
      .b
      .c
      .toString();

    System.assertEquals(
      /* Negative block comment 1 */ 0,
      0);

    System.assertEquals(
      // Negative in line comment 1
      0,
      0);
  }

  void loopComments() {
    for (
      // Inline SOQL For 1
      Contact a: [SELECT Id FROM Contact]
    ) {
    }
    for (
      Contact a: [SELECT Id FROM Contact]
      // Trailing Inline SOQL For 1
    ) {
      System.debug('Hello');
    }
    for (
      Contact a: [SELECT Id FROM Contact]
      /* Trailing Block SOQL For 1 */
    ) {
      System.debug('Hello');
    }
    for (
      Contact a: [SELECT Id FROM Contact] // Trailing EOL Inline comment
    ) {
      System.debug('Hello');
    }
    for (
      Contact a: [SELECT Id FROM Contact] /* Trailing EOL Block comment */
    ) {
      System.debug('Hello');
    }
    for (
      // Inline SOQL For 2
      Contact a: [SELECT Id, Name, Description, Birthdate FROM Contact WHERE Id != NULL AND Name != 'Hello']
    ) {
    }
    for (
      Contact a: [SELECT Id, Name, Description, Birthdate FROM Contact WHERE Id != NULL AND Name != 'Hello']
      // Trailing Inline SOQL For 2
    ) {
    }
    for (
      Contact a: [SELECT Id, Name, Description, Birthdate FROM Contact WHERE Id != NULL AND Name != 'Hello']
      /* Trailing Block SOQL For 2 */
    ) {
    }
    for (
      Contact a: [
        SELECT Id, Name, Description, Birthdate
        FROM Contact
        WHERE Id != NULL
        // Inline SOQL for 3
        AND Name != 'Hello']
    ) {
    }
    for (
      /* Block SOQL For 1 */
      Contact a: [SELECT Id FROM Contact]
    ) {
    }
    for (/* Block SOQL For 2 */ Contact a: [SELECT Id FROM Contact]) {
    }
    for (/* Block SOQL For 2 */ Contact a: [SELECT Id, Name, Description, Birthdate FROM Contact WHERE Id != NULL AND Name != 'Hello']) {
    }
  }

  void trailingCommentAfterStatement() {
    System.debug('Hello');  // Trailing Inline Comment after Statement

    System.debug('World');

    System.debug('Hello Block'); /* Trailing Block Comment after Statement */

    System.debug('World Block');
  }

  void beforeComma() {
    Integer a = 1 /* comment */,
      b = 2;
  }

  void beforeSemicolon() {
    Integer a = 1 // before semicolon line comment
      ;
    Integer b = 1 /* before same line semicolon block comment */;
    Integer c = 1 /* before next line semicolon block comment */
      ;
  }

  void blockStatementTrailingInlineComment() {
    Integer a = 1;
    // Block Statement Trailing Inline Comment
  }

  void blockStatementTrailingMultiInlineComments() {
    Integer a = 1;

    // Block Statement Trailing Multi Inline Comment 1
    // Block Statement Trailing Multi Inline Comment 2

  }

  void blockStatementTrailingBlockComment() {
    Integer a = 1;
    /* Block Statement Trailing Block Comment */
  }


  void blockStatementTrailingMultiBlockComments() {
    Integer a = 1;

    /* Block Statement Trailing Multi Block Comment 1 */
    /* Block Statement Trailing Multi Block Comment 2 */
  }

  void blockStatementCommentAttachmentOrder() {
    PageReference returnPage = someClass.doSomething();
    // Inline Comment Attachment Order
    someClass.doSomethingElse();

    someClass.doAnotherThing();
    /* Block Comment Attachment Order */
    someClass.doYetAnotherThing();

    if (1 == 1) {
      doSomething(); // if inline comment
    } else {
      doSomethingElse(); // else inline comment
    }
  }

  void commentWithSpecialCharacters() {
    datetime inDateTime = datetime.newInstance(
      dtEnddate.year(),
      dtEnddate.month(),
      dtEnddate.day(),
      system.now().hour(),
      system.now().minute(),
      system.now().second() //DATETIME.VALUEOF(dtEnddate);
    );

    switch on s {
      when JANUARY {
        System.debug('January'); // Fake closing }
      }
    }
  }

  void switchComments() {
    switch on s {
      // January comment
      when JANUARY {
        System.debug('January');
      }
      // February comment
      when FEBRUARY {
        System.debug('February');
      }
      // Default
      when else {
        System.debug('Default');
      }
    }

    switch on s {
      // January comment
      when JANUARY {
      }
      // February comment
      when FEBRUARY {
      }
      // Default
      when else {
      }
    }

    switch on s {
      /* January comment */
      when JANUARY {
        System.debug('January');
      }
      /* February comment */
      when FEBRUARY {
        System.debug('February');
      }
      /* Default */
      when else {
        System.debug('Default');
      }
    }

    switch on s {
      /* January comment */
      when JANUARY {
      }
      /* February comment */
      when FEBRUARY {
      }
      /* Default */
      when else {
      }
    }
  }

  void binaryExpression() {
    Integer i = 1;
    Integer j = 2;
    Integer a;


    a = (a == null) && (a != null) &&
      /*block Comment 1 */
      (a == null) && (a <= null);

    a =
      //comment
      i + j;

    a = i
      //comment
      + j;
    a = i -
      // Comment
      j;
    a = i
      /* Comment */
      * j;
    a = i /
      /* Comment */
      j;
    a = i
      // Comment
      <<
      /* Comment */
      j;
    a = i /* Comment */ >> /* Comment 2 */ j;
    a = /* Comments */ i >>> j /* Comments 2 */;
    a = /* Comments */ i ^ /* Comments 2 */ j;
    a = i
      // Comments
      &
      // Comments
      j;
    a = i | j
    /* Comments */;
    a =
      /* Comments */
      i
        |
        j
      /* Comments */
      ;
  }

  void commentInSOQL() {
    List<Contact> Contact = [
      SELECT
        Id,
        Name,
        // Leading Comment to a Column Clause
        Address
      FROM Contact
    ];
    List<Contact> Contact = [
      SELECT
        Id,
        Name,
        // Leading Comment to an Inner Query
        (SELECT Id FROM Accounts)
      FROM Contact
    ];
    List<Contact> contact = [
      SELECT Id
      FROM Contact
      WHERE Name = 'Name' // Trailing Inline SOQL Test 1
    ];
    List<Contact> contact = [
      SELECT Id
      FROM Contact
      WHERE Name = 'Name'
      AND Name = 'Another Name' // Trailing Inline SOQL Test 2
    ];
    List<Contact> contact = [
      SELECT Id
      FROM Contact
      WHERE Name = 'Name' // Trailing Inline SOQL Test 3
      AND Name = 'Another Name' // Trailing Inline SOQL Test 4
    ];

    List<Contact> contact = [
      SELECT Id
      FROM Contact
      WHERE Name = 'Name' /* Trailing Block SOQL Test 1 */
    ];
    List<Contact> contact = [
      SELECT Id
      FROM Contact
      WHERE Name = 'Name'
      AND Name = 'Another Name' /* Trailing Inline SOQL Test 2 */
    ];
    List<Contact> contact = [
      SELECT Id
      FROM Contact
      WHERE Name = 'Name' /* Trailing Inline SOQL Test 3 */
      AND Name = 'Another Name' /* Trailing Inline SOQL Test 4 */
    ];

    List<Contact> contact = [
      SELECT Id
      FROM Contact
      WHERE Name = 'Name'
      AND Name = 'Yet Another Name'
      // Trailing Own Line Inline SOQL Test 5
      AND Name = 'Another Name'
    ];
  }

  void conditionalComments() {
    if (a > 1)
      System.debug('Hi'); // Trailing Inline Conditional Comment 1
    else if (b > 2)
      System.debug('Hello'); // Trailing Inline Conditional Comment 2
    else
      System.debug('World'); // Trailing Inline Conditional COmment 3

    if (a > 1) {
      System.debug('Hi'); // Trailing Inline Conditional Comment 1
    } else if (b > 2) {
      System.debug('Hello'); // Trailing Inline Conditional Comment 2
    } else {
      System.debug('World'); // Trailing Inline Conditional COmment 3
    }

    if (c > 1)
      System.debug('Hi'); /* Trailing Block Conditional Comment 1 */
    else if (d > 2)
      System.debug('Hello'); /* Trailing Block Conditional Comment 2 */
    else
      System.debug('World'); /* Trailing Block Conditional COmment 3 */

    if (c > 1) {
      System.debug('Hi'); /* Trailing Block Conditional Comment 1 */
    } else if (d > 2) {
      System.debug('Hello'); /* Trailing Block Conditional Comment 2 */
    } else {
      System.debug('World'); /* Trailing Block Conditional COmment 3 */
    }

    if (a > 1) {
      System.debug('Hi');
    }
    // In between Inline Comment 1
    else if (b > 2) {
      System.debug('Hello');
    }
    // In between Inline Comment 2
    else if (c > 3) {
    }
    // In between Inline Comment 3
    else if (d > 3) System.debug('World');
    // In between Inline Comment 4
    else {
    }

    if (true) {
    }
    // In between Inline Comment 5
    else {
      System.debug('Hello');
    }

    if (a > 1) {
      System.debug('Hi');
    }
    /*in between Block Comment 1 */
    else if (b > 2) {
      // One more comment
      System.debug('Hello');
    }
    /*  in between Block Comment 2 */
    else if (c > 3) {
    }
    /*in between Block Comment 3 */
    else if (d > 3) System.debug('World');
    /* In between Block Comment 4 */
    else {
      // Some other comment here
    }

    if (true) {
    }
    /*
                       In between Block Comment 5
    */
    else {
      System.debug('Hello');
    }
  }

  void ternaryComments() {
    Integer initPrecedingCommentSingleLine =
      // Leading Inline Comment 1 for Ternary Expressions
      condition ? 1 : 0;

    Integer initPrecedingCommentMultiLine =
      /*
       * Leading Block Comment 1 for Ternary Expressions
       */
      condition ? 1 : 0;

    Integer blockComment = /* Leading single 1 */ condition ? 1 : 0;

    initPrecedingCommentSingleLine =
      // Leading Inline Comment 2 for Ternary Expressions
      condition ? 1 : 0;

    initPrecedingCommentMultiLine =
      /*
       * Leading Block Comment 2 for Ternary Expressions
       */
      condition ? 1 : 0;

    blockComment = /* Leading single 2 */ condition ? 1 : 0;

    System.debug(
      // Leading Inline Comment 3 for Ternary Expressions
      condition ? 1 : 0
    );

    System.debug(
      /*
       *Leading Block Comment 3 for Ternary Expressions
       */
      condition ? 1 : 0
    );
  }

  void newObjectComments() {
    SObject a = new SObject(
      Field__c = 'Test',
      Another_Field__c = 'Another Test' // Hello
    );
    SObject a = new SObject(
      Field__c = 'Test', // Hi
      Another_Field__c = 'Another Test' // World
    );
    SObject a = new SObject(
      Field__c = 'Test',
      Another_Field__c = 'Another Test' /* Hello */
    );
    SObject a = new SObject(
      Field__c = 'Test', /* Hi */
      Another_Field__c = 'Another Test' /* World */
    );
  }

  void tryCatchComments() {
    try {
      System.debug('Hi');
    }
    // In between inline comment 1
    catch (Exception ex) {

    }
    // In between inline comment 2
    finally {
      // Some other comment here
    }

    try {
      System.debug('Hi');
    }
    catch (Exception ex) {
      // In between inline comment 1
    }
    finally {
      // In between inline comment 2
    }

    try {
      System.debug('Hi');
    }
    // In between inline comment 1
    catch (Exception ex) {
    } finally {   // Some other comment here
      // In between inline comment 2
    }

    try {
      System.debug('Hi');
    }
    // In between inline comment 3
    catch (Exception ex) {
      System.debug('Hello');
    }
    // In between inline comment 4
    finally {
      System.debug('World');
    }

    try {
      System.debug('Hi');
    }
    /* In between block comment 1 */
    catch (Exception ex) {

    }
    /* In between block comment 2 */
    finally {

    }

    try {
      System.debug('Hi');
    }
    /* In between block comment 3 */
    catch (Exception ex) {
      System.debug('Hello');
    }
    /* In between block comment 4 */
    finally {
      System.debug('World');
    }
  }

  void doWhileComments() {
    do {
      System.debug('Hi');
    }
    //in between inline comment 1
    while (true);

    do {
      System.debug('Hi');
    }
    //in between inline comment 2
    while (true);

    do {
      System.debug('Hi');
    }
    /*        In between block comment 1  */     
    while (true);

    do {
      System.debug('Hi');
    }
    /* in between block comment 2 */
    while (true);
  }

  @isTest //decorator Trailing Inline Comment 1
  void trailingCommentAfterMethodName() {
    System.debug('Hi');
  }

  /*decorator Leading Block Comment 1 */ @isTest
  void leadingCommentBeforeAnnotation() {
    System.debug('Hi');
  }

  @isTest //decorator Trailing Inline Comment 2
  @AuraEnabled // Decorater Trailing Inline Comment 3
  void trailingCommentAfterMethodName() {
    System.debug('Hi');
  }

  @isTest /*Decorator Trailing Block Comment 1 */
  void trailingCommentAfterMethodName() {
    System.debug('Hi');
  }

  /*Decorator Leading Block Comment 1 */ @isTest
  void trailingCommentAfterMethodName() {
    System.debug('Hi');
  }

  @isTest(
    seeAllData = true // Method annotation inline comment 1
    //isParallel = false // Method annotation inline comment 2
  )
  void methodAnnotationInlineComment() {
  }

  @isTest(
    seeAllData = true /* Method annotation block comment 1 */
    /*isParallel = false // Method annotation block comment 2 */
  )
  void methodAnnotationBlockComment() {
  }
}
//  Trailing Inline Comment

/*Trailing Block Comment   */
