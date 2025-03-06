trigger TriggerExplicitAccessModifier on Account(
  before delete,
  before insert,
  before update,
  after delete,
  after insert,
  after update,
  after undelete,
  before undelete
) {
  Triggers.IHandler handler = new SomeHandler();
  Triggers.dispatcher
    .bind(TriggerOperation.BEFORE_INSERT, new SomeHandler())
    .bind(TriggerOperation.BEFORE_INSERT, new SomeHandler())
    .bindAsync(TriggerOperation.AFTER_INSERT, handler)
    .bindAsync(TriggerOperation.AFTER_DELETE, handler)
    .bindAsync(TriggerOperation.AFTER_UNDELETE, handler)
    .run(new SomeHandler());
  Integer q, w = 2;
  String ww;
}
