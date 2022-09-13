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

  @InvocableMethod(label='Label' description='Description' category='Category')
  List<String> getAccountNames(List<ID> ids) {}

  @InvocableMethod(callout=true)
  List<String> getAccountNamesWithCallout(List<ID> ids) {}

  @invocablemethod
  public static List <Results> execute (List<Requests> requestList) {}

  @InvocableVariable(label='Records for Input' description='yourDescription' required=true)
  public List<SObject> inputCollection;
}
