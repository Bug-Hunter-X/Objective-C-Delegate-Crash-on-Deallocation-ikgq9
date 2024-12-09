In Objective-C, a common yet subtle error arises when dealing with memory management and object lifecycles, particularly with delegate patterns.  Consider this scenario:

```objectivec
@interface MyViewController : UIViewController <MyDelegate>
@property (nonatomic, weak) id <MyDelegate> delegate;
@end

@implementation MyViewController
- (void)someMethod {
    if ([self.delegate respondsToSelector:@selector(myDelegateMethod)]) {
        [self.delegate myDelegateMethod];
    }
}
@end
```

If `myDelegateMethod` modifies the state of `self` (the `MyViewController`), and the delegate is in the process of being deallocated, calling `[self.delegate myDelegateMethod]` can lead to crashes or unexpected behavior.  The `weak` reference prevents a retain cycle, but doesn't guarantee the delegate still exists.