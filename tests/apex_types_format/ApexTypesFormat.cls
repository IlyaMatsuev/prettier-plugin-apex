class ApexTypesFormat {
  private list<String> aCopy = new list<string>(veryLongVariable.getOneSet().getAnotherSet().getYetAnotherSet());
  private static list<string> aCopy = new list<string>(superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak.getOneSet().getAnotherSet().getYetAnotherSet());

  public map<id,map<String,string>> www { get; set; }


  void newlistTest() {
    list<string> a = new list<string>();
    list<String> aCopy = new list<string>(veryLongVariable.getOneSet().getAnotherSet().getYetAnotherSet());
    list<String> aCopy = new list<string>(superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak.getOneSet().getAnotherSet().getYetAnotherSet());
    list<String> aCopy = new list<string>(superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak && anotherSuperDuperVeryInsanelyLongVariableNameThatWillSurelyBreak);
    List<String> aCopy = new List<string>(a);
    List<String> b = new String[]{};
    String[] c = new String[]{};
    String[] d = new String[]{'a', 'b'};
    string[] e = new string[]{'Long string number one', 'Long string number two'};
    string[] f = new string[1];
    string[] g = new List<string>(f);
    string[] h = new String[0];
  }

  void newSetTest() {
    Set<String> a = new Set<String>();
    Set<String> aCopy = new Set<string>(aCopy);
    Set<string> superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak = new Set<string>();
    Set<string> aCopy = new Set<string>(veryLongVariable.getOneSet().getAnotherSet().getYetAnotherSet());
    Set<string> aCopy = new Set<string>(superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak.getOneSet().getAnotherSet().getYetAnotherSet());
    Set<string> aCopy = new Set<String>(superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak && anotherSuperDuperVeryInsanelyLongVariableNameThatWillSurelyBreak);
    Set<String> b = new Set<String>{};
    Set<String> c = new Set<String>{'a', 'b'};
    Set<String> c = new Set<String>{'Long string number one', 'Long string number two'};
  }

  void newMapTest() {
    Map<String, String> a = new Map<String, String>();
    Map<String, String> aCopy = new Map<String, String>(a);
    Map<String, String> superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak = new Map<String, String>();
    map<String, String> aCopy = new map<String, String>(veryLongVariable.getOneSet().getAnotherSet().getYetAnotherSet());
    map<String, String> aCopy = new map<String, String>(superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak.getOneSet().getAnotherSet().getYetAnotherSet());
    map<String, String> aCopy = new map<String, String>(superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak && anotherSuperDuperVeryInsanelyLongVariableNameThatWillSurelyBreak);
    map<String, String> b = new map<String, String>{};
    map<String, String> c = new map<String, String>{'a' => 'b', 'c' => 'd'};
    map<String, String> c = new map<String, String>{'Long string key' => 'Long string value', 'Long string key two' => 'Long string value two'};
    map<String, String[]> d = new map<String, String[]>{
      'a' => new String[]{'a','b'},
      'b' => new String[]{'c','d'}
    };
    map<String, Decimal> fmaIntegerParameterNameDefaultValue = new map<string, decimal>
    {'Parameter1'=> 1,
    'Parameter2' => 0 ,
    'Parameter3'=> 500 };
  }

  void newKeyValueTest() {
    Account a = new Account(Name='Account Name');
    Account b = new Account(Name='Account Name', Description='Account Description That Is Very Long');
    Account b = new Account(Name='Account Name', Description='Account Description That Is Very Long' + 'Some Other Description That Is Also Very Long');
    Account account = new Account(
      Body__c = JSON.serialize(new map<String, Object>{'Content' => 'Hello', 'World' => 'There'})
    );
    Account account = new Account(
      Body__c = JSON.serialize(new map<String, Object>{'Content' => 'Hello', 'World' => 'There', 'Hi' => 'Yes'})
    );
  }

  void chainTest() {
    system.debug('qweqw');
    datetime q = system.now().toDate();
    id w = SCHEMA.sobjecT.ID;
    string e = SCHEMA.sobjecT.ID.toString();
    id r = new Entity().id;
    e.map(1, 2).set('2')[set(1)];
  }

  void newStandardTest() {
    JWS a = new JWS('payload', 'certDevName');
    JWS b = new JWS('Very long payload but still fit in one line', 'very long cert dev name');
    JWS c = new JWS('Very long payload that is definitely too long so that all the parent groups must break', 'very long cert dev name');
  }

  void newComplicatedTypesTest() {
    map<String, map<String, String>> a = new map<String, Map<String, String>> {
      'a' => new Map<String, String> {
        'b' => 'c'
      },
      'd' => new Map<String, String> {
        'e' => 'f'
      }
    };
    Map<String, List<String>> b = new Map<String, List<String>> {
      'a' => new list<String>(5),
      'b' => new list<String> {'c','d','e'}
    };
    Map<list<String>, list<String>> c = new Map<list<String>, list<String>> {
      new list<String>{'a'} => new list<String>{'b','c'},
      new list<String>{'d'} => new list<String>{'e','f'}
    };
    list<list<String>> d = new list<list<String>>(5);
  }
}

