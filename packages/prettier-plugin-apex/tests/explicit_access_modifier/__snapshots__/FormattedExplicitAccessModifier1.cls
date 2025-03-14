@IsTest
public with sharing virtual class ExplicitAccessModifier {
  public final transient HttpRequest request;
  private static final HttpRequest request;
  private static final HttpRequest request;
  private static final transient HttpRequest request;

  private List<String> a = new List<String>();
  private String firstString, secondString;
  private String a = 'aaa', b = 'bbb';

  public String nonDefaultSetter {
    private get;
    set {
      nonDefaultSetter = value;
    }
  }

  public static final String nonDefaultGetterSetter {
    protected get {
      return nonDefaultGetterSetter;
    }
    private set {
      nonDefaultGetterSetter = value;
    }
  }

  @TestVisible
  private String nonDefaultGetterSetter {
    get {
      if (nonDefaultGetterSetter != '') {
        nonDefaultGetterSetter = '';
      }
      return nonDefaultGetterSetter;
    }
    private set {
      nonDefaultGetterSetter = value;
    }
  }

  private static final transient String nonDefaultGetterSetter {
    get {
      if (nonDefaultGetterSetter != '') {
        nonDefaultGetterSetter = '';
      }
      return nonDefaultGetterSetter;
    }
    set {
      System.debug('qqq');
      nonDefaultGetterSetter = value;
    }
  }

  @TestVisible
  private static final List<UnknownClass.InnerClass> nestedList = new List<UnknownClass.InnerClass>();

  public without sharing abstract class NestedClassTest {
    private String nonDefaultSetter {
      private get;
      set {
        nonDefaultSetter = value;
      }
    }

    private transient String nonDefaultSetter {
      private get;
      set {
        nonDefaultSetter = value;
      }
    }

    @IsTest
    public transient String nonDefaultSetter {
      private get;
      set {
        nonDefaultSetter = value;
      }
    }

    private void methodOne() {
      Integer w;
    }

    @TestVisible
    private abstract void methodTwo();

    public abstract void methodTwo();

    private virtual override void methodTwo() {
    }

    protected override void methodTwo() {
    }

    webservice static void methodThree() {
    }
  }

  private interface InterfaceTest {
    void methodOne();
    void methodTwo();
  }

  private interface InterfaceTest2 {
    void methodOne();
    void methodTwo();
  }

  @JsonAccess
  private with sharing class EnumTest {
    public enum Season {
      WINTER,
      SPRING,
      SUMMER,
      FALL
    }
    private enum Month {
      JANUARY
    }

    public EnumTest(final String param) {
    }

    public EnumTest(String param, final Integer param2) {
    }

    @TestVisible
    private enum AccountTypeOne {
      BUSINESS_ACCOUNT,
      PERSON_ACCOUNT
    }

    @TestVisible
    public enum AccountTypeTwo {
      BUSINESS_ACCOUNT,
      PERSON_ACCOUNT
    }

    @TestVisible
    private static enum AccountTypeTwo {
      BUSINESS_ACCOUNT,
      PERSON_ACCOUNT
    }

    @TestVisible
    private enum AccountTypeThree {
      BUSINESS_ACCOUNT,
      PERSON_ACCOUNT
    }

    private void enumTest(final String param) {
      final Integer i = Season.WINTER.ordinal();
      String s = Season.SPRING.name();
      final Season[] values = Season.values();
    }
  }

  @isTest(seeAllData=true)
  // Dangling comment
  private static void trailingCommentAfterMethodName() {
    System.debug('Hi');
  }

  @isTest(seeAllData=true)
  /* Dangling comment */
  private static void trailingCommentAfterMethodName() {
    System.debug('Hi');
  }

  @isTest(seeAllData=true)
  /* 
      Dangling comment
    */
  private static void trailingCommentAfterMethodName() {
    System.debug('Hi');
  }

  @isTest // Decorator Trailing Inline Comment 1
  public static void trailingCommentAfterMethodName() {
    System.debug('Hi');
  }
}
