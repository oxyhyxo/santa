/// Copyright 2023 Google LLC
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///     https://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.

#import "Source/common/SNTFileAccessEvent.h"

@implementation SNTFileAccessEvent

#define ENCODE(o)                               \
  do {                                          \
    if (self.o) {                               \
      [coder encodeObject:self.o forKey:@(#o)]; \
    }                                           \
  } while (0)

#define DECODE(o, c)                                             \
  do {                                                           \
    _##o = [decoder decodeObjectOfClass:[c class] forKey:@(#o)]; \
  } while (0)

- (instancetype)init {
  self = [super init];
  if (self) {
  }
  return self;
}

+ (BOOL)supportsSecureCoding {
  return YES;
}

- (void)encodeWithCoder:(NSCoder *)coder {
  ENCODE(accessedPath);
  ENCODE(ruleVersion);
  ENCODE(ruleName);
  ENCODE(fileSHA256);
  ENCODE(filePath);
  ENCODE(application);
  ENCODE(teamID);
  ENCODE(teamID);
  ENCODE(pid);
  ENCODE(ppid);
  ENCODE(parentName);
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
  self = [super init];
  if (self) {
    DECODE(accessedPath, NSString);
    DECODE(ruleVersion, NSString);
    DECODE(ruleName, NSString);
    DECODE(fileSHA256, NSString);
    DECODE(filePath, NSString);
    DECODE(application, NSString);
    DECODE(teamID, NSString);
    DECODE(teamID, NSString);
    DECODE(pid, NSNumber);
    DECODE(ppid, NSNumber);
    DECODE(parentName, NSString);
  }
  return self;
}

- (NSString *)description {
  return [NSString
    stringWithFormat:@"SNTFileAccessEvent: Accessed: %@, By: %@", self.accessedPath, self.filePath];
}

@end
