public class SimpleMethod implements FirstSampleInterface, SecondSampleInterface {
  public String longMethodNameWithNoParamsShouldNotBreakInEmptyParamListAndYetSomehowDoes() {
  }

  public String sayHello() {
    return this.sayHello('Hello', 'World');
  }

  public String sayHello(String subject) {
    return sayHello('Hello', subject);
  }

  public String sayHelloWithModifier(static final String subject) {
    return null;
  }

  public String sayHelloWithDate() {
    SimpleMethod that = new SimpleMethod();
    DateTime rightNow = that.getNow(),
      tomorrow,
      yesterday = DateTime.now().addDays(-1);
    return 'Hello at ' + now.format();
  }

  private String sayHello(String action, String subject) {
    return action + ' ' + subject;

    return 'a long string ' +
      'from concatenating ' +
      'many other strings ' +
      'together.';

    return generator.objectBuilder
      .setExternalId(account.personContactId)
      .getInstance();
  }

  private String sayHelloWithLongListOfParameters(
    String action,
    String subject,
    String location,
    Datetime dt
  ) {
    return action + ' ' + subject + location + String.valueOf(dt);
  }

  void doNothing() {
    return;
  }

  private DateTime getNow() {
    return DateTime.now();
  }

  void simpleBooleanExpressions() {
    Boolean b = true;
    Boolean a = true || ((true && b) && (true || false));
  }

  void longMethodCall() {
    VeryLongOuterClassNameExtension.InnerWrapperClassName innerClass = new VeryLongOuterClassNameExtension.InnerWrapperClassName();
    controller.addFields(
      new List<String> { 'Very_Long_SObject_Chain__r.An_Inner_SObject__r.Name' }
    );
    controller.addFields(
      new List<String> {
        'Very_Long_SObject_Chain__r.An_Inner_SObject__r.Name',
        'Another_Long_SObject_Chain__r.Name'
      }
    );
    ((SObject) a)
      .get('Very_Long_Field_Name__c')
      .subString(0, 5)
      .escapeHtml4()
      .escapeEcmaScript()
      .escapeJava()
      .escapeUnicode();
  }

  @InvocableMethod(
    label='Insert Accounts'
    description='Inserts the accounts specified and returns the IDs of the new accounts.'
  )
  public static List<ID> insertAccounts(List<Account> accounts) {
    return null;
  }
}
