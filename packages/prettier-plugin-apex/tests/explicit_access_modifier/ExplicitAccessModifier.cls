with sharing virtual   public @IsTest class ExplicitAccessModifier
{
    public transient final HttpRequest request;
    private static final HttpRequest request;
    static final HttpRequest request;
    static final transient HttpRequest request;

    List<String> a = new List<String>();
    String firstString, secondString;
    String a = 'aaa', b = 'bbb';

    public String nonDefaultSetter {
        private get;

        set {
            nonDefaultSetter = value;
        }
    }

    public final  static String nonDefaultGetterSetter {
        protected get {
            return nonDefaultGetterSetter;
        }

        private set {
            nonDefaultGetterSetter = value;
        }
    }

    @TestVisible private String nonDefaultGetterSetter {
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

    static final transient String nonDefaultGetterSetter {
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
    final static List<UnknownClass.InnerClass> nestedList = new List<UnknownClass.InnerClass>();

    abstract public without sharing class NestedClassTest {
        String nonDefaultSetter {
            private get;

            set {
            nonDefaultSetter = value;
            }
        }

        transient String nonDefaultSetter {
            private get;

            set {
            nonDefaultSetter = value;
            }
        }

        @IsTest public transient String nonDefaultSetter {
            private get;

            set {
            nonDefaultSetter = value;
            }
        }
        
        void methodOne() {
            Integer w;
        }

        @TestVisible abstract void methodTwo();

        abstract public void methodTwo();

        virtual override void methodTwo() {
        }

        override protected void methodTwo() {}

        static webService void methodThree() {
        }
    }

    interface InterfaceTest {
        void methodOne();
        void methodTwo();
    }

    private interface InterfaceTest2 {
        void methodOne();
        void methodTwo();
    }

    @JsonAccess
    with sharing class EnumTest {
        public enum Season {WINTER, SPRING, SUMMER, FALL}
        enum Month {JANUARY}

        public EnumTest(final String param) {
        }

        public EnumTest(String param, final Integer param2) {
        }

        @TestVisible
        private enum AccountTypeOne {
            BUSINESS_ACCOUNT,
            PERSON_ACCOUNT
        }

        @TestVisible public enum AccountTypeTwo {
            BUSINESS_ACCOUNT,
            PERSON_ACCOUNT
        }

        @TestVisible static enum AccountTypeTwo {
            BUSINESS_ACCOUNT,
            PERSON_ACCOUNT
        }

        @TestVisible enum AccountTypeThree {
            BUSINESS_ACCOUNT,
            PERSON_ACCOUNT
        }

        void enumTest(final String param) {
            final Integer i = Season.WINTER.ordinal();
            String s = Season.SPRING.name();
            final Season[] values = Season.values();
        }
    }

    @isTest(seeAllData = true)
    // Dangling comment
    static void trailingCommentAfterMethodName() {
        System.debug('Hi');
    }

    @isTest(seeAllData = true)
    /* Dangling comment */
    static void trailingCommentAfterMethodName() {
        System.debug('Hi');
    }

    @isTest(seeAllData = true)
    /* 
      Dangling comment
    */
    static void trailingCommentAfterMethodName() {
        System.debug('Hi');
    }

    @isTest // Decorator Trailing Inline Comment 1
    public static void trailingCommentAfterMethodName() {
        System.debug('Hi');
    }
}
