# Unreleased

## Formatting Changes

### Change the formatting behaviour for the `apexFormatInlineComments` option

Now this option is a `choice`. Below is the input code snippet and the examples of how it could be formatted with different option values:

Input:

```java
//some inline comment
//   another inline comment
```

Output:

- `none`

```java
//some inline comment
//   another inline comment
```

- `spaced`

```java
// some inline comment
//   another inline comment
```

- `trimed`

```java
// some inline comment
// another inline comment
```

- `strict`

```java
// Some inline comment
// Another inline comment
```

# 2.1.0

## Formatting Changes

### Convert `testmethod` modifier to the `@IsTest` annotation

The `apexFormatAnnotations` option now will convert all `testmethod` method modifiers to the equivalent annotation. If the option `apexFormatAnnotations` is set to `true` then...

This:

```java
public testmethod static someTestMethod() {
}
```

Will become this:

```java
@IsTest
public static someTestMethod() {
}
```

### Convert `webservice` and `testmethod` modifier to lowecase

Was:

```java
public TestMethod static someTestMethod() {
}

webService static someWebservice() {
}
```

Now:

```java
public testmethod static someTestMethod() {
}

webservice static someWebservice() {
}
```

# 2.0.0

## Formatting Changes

### Add space for collections initializations with elements

Was:

```java
List<String> list = new List<String>{
  '1'
};
Set<String> list = new Set<String>{
  '1'
};
Map<String, String> list = new Map<String, String>{
  '1' => '2'
};
```

Now:

```java
List<String> list = new List<String> {
  '1'
};
Set<String> list = new Set<String> {
  '1'
};
Map<String, String> list = new Map<String, String> {
  '1' => '2'
};
```

## New options

### Format inline comments

If the option `apexFormatInlineComments` is set to `true` then...

This:

```java
//some comment
if (true) {   //                   another comment
    //
    //another
}
```

Will become this:

```java
// Some comment
if (true) {     // Another comment
    //
    // Another
}
```

### Format annotations

If the option `apexFormatAnnotations` is set to `true` then...

This:

```java
@isTest
public class SomeClass {
    @testvisible
    private final String field1;
}
```

Will become this:

```java
@IsTest
public class SomeClass {
    @TestVisible
    private final String field1;
}
```

This works for all Apex annotations - they get formatted as upper camel case

Additionally, if you set the `apexAnnotationsArgsSpacing` option to `true`, the annotation arguments will get split with spaces between the equals sign, and...

This:

```java
@RestResource(urlMapping='/')
public class SomeClass {
    @InvocableMethod(label='1' description='2')
    private static String method1() {
    }
}
```

Will become this:

```java
@RestResource(urlMapping = '/')
public class SomeClass {
    @InvocableMethod(label = '1' description = '2')
    private static String method1() {
    }
}
```

### Avoid line break for empty blocks

If the option `apexEmptyBlockBracketLine` is set to `true` then...

This:

```java
public class SomeClass {
    public String method1() {
    }

    public String method2() {
        if (true) {
        } else {
        }

        if (true) {
            // Some comment
        }
    }

    public class AnotherClass {
    }
}
```

Will become this:

```java
public class SomeClass {
    public String method1() {}

    public String method2() {
        if (true) {} else {}

        if (true) {
            // Some comment
        }
    }

    public class AnotherClass {}
}
```

This works for all block statements: classes, interfaces, enums, methods, loops, etc.

### Format standard Apex types

If the option `apexFormatStandardTypes` is set to `true` then...

This:

```java
public class SomeClass {
    public map<integer,string> someMap = new map<integer,string>();

    public string method1(list<boolean> someList) {
        system.debug(datetime.now());
        system.debug(userInfo.getUserId());
        decimal q = 1;
    }
}
```

Will become this:

```java
public class SomeClass {
    public Map<Integer, String> someMap = new Map<Integer, String>();

    public String method1(List<Boolean> someList) {
        System.debug(DateTime.now());
        System.debug(UserInfo.getUserId());
        Decimal q = 1;
    }
}
```

This doesn't work for `ALL` standard types but for the most used namespaces: collections, data types, System, Schema, Math etc.
If you'd like to have some other types as well, please create an issue or open a discussion.

### Avoid expanding properties when it's not necessary

Sometimes it's not really necessary to expand the whole property block if your property returns one small statement from in getter, or just sets the variable in setter. If the option `apexExpandOneLineProperties` is set to `false` (it's enabled by default) then...

This:

```java
public class SomeClass {
    public Id orderId {
        get {
            return getId(Order.Id);
        }
    }
    public Id contractId {
        get {
            return getId(Order.ContractId);
        }
    }
    public String prop1 {
      get {
          return getString(Order.Fieldq__c);
      }
      set {
          prop1 = value;
      }
    }
    // This is example with more that 1 statement in the getter
    public String prop2 {
        get {
            if (prop2 == null) {
              prop2 = '1';
            }
            return getString(Order.Fieldq__c);
        }
        set {
            prop1 = value;
        }
    }
    public String propertyWithTheReallyLongNameThatWillExceedThePrintWidthPrettierLimitIfItWasExpanded {
        get {
            return getString(Order.Fieldq__c);
        }
        set {
            prop1 = value;
        }
    }
}
```

Will become this:

```java
public class SomeClass {
    public Id orderId { get { return getId(Order.Id); } }
    public Id contractId { get { return getId(Order.ContractId); } }
    public String prop1 { get { return getString(Order.Fieldq__c); } set { prop1 = value; } }
    // This is example with more that 1 statement in the getter
    public String prop2 {
        get {
            if (prop2 == null) {
              prop2 = '1';
            }
            return getString(Order.Fieldq__c);
        }
        set {
            prop1 = value;
        }
    }
    public String propertyWithTheReallyLongNameThatWillExceedThePrintWidthPrettierLimitIfItWasExpanded {
        get { return getString(Order.Fieldq__c); }
        set { prop1 = value; }
    }
}
```

### Auto-add private modifiers if access modifier was not provided

If you want to keep your variables and methods declarations in the same style across the projects you may want to force the explicit access modifier to be provided. If the option `apexExplicitAccessModifier` is set to `true` then...

This:

```java
class SomeClass {
    public Id orderId;
    Id anotherId;

    static Id contractId {
        get {
            return getId(Order.ContractId);
        }
    }

    protected void method1() {
        final Integer i = 1;
    }

    @TestVisilbe
    void method2() {
    }

    abstract void method3();

    // Interface methods can not be defined with an access modifier
    interface SomeInterface {
        void method1();
        void method2();
    }
}
```

Will become this:

```java
private class SomeClass {
    public Id orderId;
    private Id anotherId;

    private static Id contractId {
        get {
            return getId(Order.ContractId);
        }
    }

    protected void method1() {
        final Integer i = 1;
    }

    @TestVisilbe
    private void method2() {
    }

    private abstract void method3();

    // Interface methods can not be defined with an access modifier
    private interface SomeInterface {
        void method1();
        void method2();
    }
}
```

### Format modifiers in the strict order

In Apex there is no strict order for providing the modifiers like `public`, `static`, `final`, `transient` and so on. Therefore, in order to make your variables and method definitions look consistent, you can use this option. If the option `apexSortModifiers` is set to `true` then...

This:

```java
public virtual with sharing class SomeClass {
    public Id orderId;
    final static transient public Id anotherId;

    transient static Id contractId {
        get {
            return getId(Order.ContractId);
        }
    }

    protected override virtual void method1() {
        final Integer i = 1;
    }

    static private void method2() {
    }

    abstract protected void method3();
}
```

Will become this:

```java
public with sharing virtual class SomeClass {
    public Id orderId;
    public static final transient Id anotherId;

    static transient Id contractId {
        get {
            return getId(Order.ContractId);
        }
    }

    protected virtual override void method1() {
        final Integer i = 1;
    }

    private static void method2() {
    }

    protected abstract void method3();
}
```

If you have a concern about the order of the modifiers or you'd like to change something, create a story or open a discussion for that.
