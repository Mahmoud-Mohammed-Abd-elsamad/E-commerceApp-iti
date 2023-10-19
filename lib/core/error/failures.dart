class Failures{
  final String message;
  Failures(this.message);
  @override
  String toString() {
    // TODO: implement toString
    return message;
  }
}

class RemoteFailure extends Failures{
  RemoteFailure(super.message);
}

class CacheFailure extends Failures{
  CacheFailure(super.message);
}