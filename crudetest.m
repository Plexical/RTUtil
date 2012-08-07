// -*- mode: objc -*-
// Copyright 2012 Plexical, copying see LICENCE.md
//
// This module is only pure Objective C, it can be quickly tested on
// the commandline using only `clang`. The `testit.sh` shell script
// will compile and run the test.
//
// The process will terminate immediately, that gives us the luxury to
// ignore posssible leaks.

#import "RTUtil.h"

@interface WithFoo: NSObject
-(void) foo;
@end

@implementation WithFoo
-(void) foo { }
@end

void test(NSString *name, BOOL result) {
  if (result == YES) {
    NSLog(@"%@ OK", name);
  } else {
    NSLog(@"%@ failed");
  }
}

int main(int argc, char *argv[])
{
  NSMutableArray *methods = rt_methods([[WithFoo alloc] init]);

  test(@"'foo' in object", [methods containsObject:@"foo"]);
}
