class GetterSetter {
  public String shortProperty { get; set; }

  public String veryLongPropertyNameThatWillExceedTheDefaultOfCharacterAndWillBreak {
    get;
    set;
  }

  public String nonDefaultGetter {
    get {
      return builder.more()
        .more()
        .more()
        .more()
        .more()
        .more()
        .more()
        .more()
        .more()
        .more()
        .more()
        .more()
        .more();
    }
    set;
  }

  public String nonDefaultGetter {
    get { return builder.more(); }
    set { q = value.more().more().more().more().more().more().more(); }
  }

  public String nonDefaultGetter { get { return 'Hello'; } private set; }

  public String nonDefaultGetter { get { return 'Hello'; } private set { } }

  public String nonDefaultSetter {
    private get;
    set { nonDefaultSetter = value; }
  }

  public String nonDefaultGetterSetter {
    get { return nonDefaultGetterSetter; }
    set { nonDefaultGetterSetter = value; }
  }

  public String nonDefaultGetterSetter {
    get {
      if (nonDefaultGetterSetter != '') {
        nonDefaultGetterSetter = '';
      }
      return nonDefaultGetterSetter;
    }
    set { nonDefaultGetterSetter = value; }
  }

  public String nonDefaultGetterSetter {
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

  public String nonDefaultGetterSetter {
    get;
    set {
      // Comment!
      nonDefaultGetterSetter = value;
    }
  }
}
