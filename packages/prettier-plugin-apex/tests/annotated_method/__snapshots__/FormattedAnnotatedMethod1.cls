class topLevelClass {
  @AuraEnabled
  public String someProperty { get; set; }

  @AuraEnabled(cacheable = true continuation = true)
  public static Account getAccount(Id accountId) {}

  @SuppressWarnings('PMD.ApexCRUDViolation')
  void someMethod() {}

  @SuppressWarnings('PMD.ApexCRUDViolation, PMD.AnotherViolation')
  void anotherMethod() {}

  @InvocableMethod(
    label = 'Label'
    description = 'Description'
    category = 'Category'
  )
  List<String> getAccountNames(List<ID> ids) {}

  @InvocableMethod(callout = true)
  List<String> getAccountNamesWithCallout(List<ID> ids) {}

  @InvocableMethod
  public static List<Results> execute(List<Requests> requestList) {}

  @InvocableVariable(
    label = 'Records for Input'
    description = 'yourDescription'
    required = true
  )
  public List<SObject> inputCollection;

  @IsTest
  static void someTest() {}

  @IsTest
  @SuppressWarnings('PMD')
  static void someTest() {}

  @IsTest
  public static void someTest() {}

  @IsTest(seeAllData = true)
  static void someTest() {}

  @IsTest(seeAllData = true)
  static void someTest() {}
}
