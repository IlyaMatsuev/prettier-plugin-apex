with sharing @IsTest class ExplicitAccessModifier
{
    public final HttpRequest request;
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

    public final   String nonDefaultGetterSetter {
        protected get {
            return nonDefaultGetterSetter;
        }

        private set {
            nonDefaultGetterSetter = value;
        }
    }

    @TestVisible String nonDefaultGetterSetter {
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

    public abstract class NestedClassTest {
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
    class EnumTest {
        public enum Season {WINTER, SPRING, SUMMER, FALL}
        enum Month {JANUARY}

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

        void enumTest() {
            final Integer i = Season.WINTER.ordinal();
            String s = Season.SPRING.name();
            final Season[] values = Season.values();
        }
    }
}
