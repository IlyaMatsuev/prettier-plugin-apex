class topLevelClass {
  @auraenabled public String someProperty {
    get;
    set;
  }

  public static @auraEnabled(cacheable=true continuation=true) Account getAccount(Id accountId) {
  }

  @SuppressWarnings('PMD.ApexCRUDViolation')
  void someMethod(){}

  @SuppressWarnings('PMD.ApexCRUDViolation, PMD.AnotherViolation')
  void anotherMethod(){}

  @InvocableMethod(Label='Label' Description='Description' category='Category')
  List<String> getAccountNames(List<ID> ids) {}

  @InvocableMethod(CALLOUT=true)
  List<String> getAccountNamesWithCallout(List<ID> ids) {}

  @invocablemethod
  public static List <Results> execute (List<Requests> requestList) {}

  @InvocableVariable(label='Records for Input' DESCRIPTION=  'yourDescription' required = true)
  public List<SObject> inputCollection;

  static testmethod void someTest() {

  }

  @SuppressWarnings('PMD')
  static testmethod void someTest() {

  }

  @istest
  public static testmethod void someTest() {
    
  }

  @istest(seealldata=true)
  static testmethod void someTest() {
    
  }

  @istest(seeAllData=true)
  static void someTest() {
    
  }
}
