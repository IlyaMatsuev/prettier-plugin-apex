class ConditionalFoceCurly {
  public void conditionalTest() {
    Integer a = 2;
    Integer b = 1;
    if (2 > 1) {}
    if (DateTime.now() > DateTime.now.addDays(-1)) {
      System.debug('Test Debug');
    }
    Integer c = a > b ? a : b;
    a < b ? System.debug('Hi') : System.debug('Hello');

    Map<String, String> stringMap = new Map<String, String>();
    if (stringMap.contains('a')) {
      System.debug('Hello');
    }

    if (a > b) {
      c = a;
    } else if (a < b) {
      c = b;
    } else {
      c = 0;
    }

    if (a > b) c = a;

    if (a == 1) a = 2; else if (a == 2) a = 3; else a = 4;

    if (a == 1) a = 2; else if (a == 2) { a = 3; } else { a = 4; }
    if (a == 1) { a = 2; } else if (a == 2) a = 3; else a = 4;

    if (true && (false || false)) {
      System.debug('false');
    }
  }

  void veryLongConditional() {
    if (!SObjectType.Attribute__c.fields.Name.isAccessible() && !SObjectType.Attribute__c.fields.Display_on_Actions_Tab__c.isAccessible() || !SObjectType.Attribute__c.fields.Display_Order__c.isAccessible() || !SObjectType.Attribute__c.fields.Icon__c.isAccessible() || !SObjectType.Action__c.fields.Name.isAccessible() || !SObjectType.Action__c.fields.Description__c.isAccessible() || !SObjectType.Action__c.fields.Translation_Index__c.isAccessible() || !SObjectType.Action__c.fields.State__c.isAccessible() || !SObjectType.Action__c.fields.Display_Tab__c.isAccessible() || !SObjectType.Action__c.fields.Display_Tile__c.isAccessible() || !SObjectType.Action__c.fields.Action_Type_Attribute__c.isAccessible() || !SObjectType.Action__c.fields.Tile_Type_Attribute__c.isAccessible() || !SObjectType.Action__c.fields.From_Date__c.isAccessible() || !SObjectType.Action__c.fields.To_Date__c.isAccessible() || !SObjectType.Action__c.fields.Parent__c.isAccessible() | !SObjectType.Action__c.fields.RecordTypeId.isAccessible()) {
      System.debug('true');
    }
  }
}

