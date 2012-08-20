// -*- mode: objc -*-
// Copyright 2012 Plexical, copying see LICENCE.md

#import "RTUtil.h"

NSArray *rt_methods(id obj) {

  int idx = 0;
  unsigned int method_count;

  Method *cmethods = class_copyMethodList([obj class], &method_count);
  NSMutableArray *result =
    [[NSMutableArray alloc] initWithCapacity:method_count];
  for(idx = 0; idx < method_count; idx++) {
    SEL selector = method_getName(cmethods[idx]);
    [result addObject:
              [NSString stringWithCString:sel_getName(selector)
                                 encoding:NSUTF8StringEncoding]];
  }
  free(cmethods);
  return result;
}

NSString *rt_classname(id obj) {
  return [NSString
           stringWithCString:class_getName([obj class])
                    encoding:NSUTF8StringEncoding];
}
