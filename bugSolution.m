The solution is to check if the delegate is still valid before calling the method:

```objectivec
@implementation MyViewController
- (void)someMethod {
    id <MyDelegate> strongDelegate = self.delegate; // Create a strong reference
    if (strongDelegate && [strongDelegate respondsToSelector:@selector(myDelegateMethod)]) {
        [strongDelegate myDelegateMethod];
    }
}
@end
```

By creating a strong temporary reference (`strongDelegate`) we ensure the object will not be deallocated during the method invocation.  After the method call the temporary strong reference is released.  Alternatively, you can use `dispatch_async` to ensure the method is executed on the next run loop iteration, giving the system time to deallocate objects. However, this approach depends on the particular situation and can affect performance or timing requirements.