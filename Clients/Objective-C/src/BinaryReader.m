//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: ./com/us/openserver/protocols/BinaryReader.java
//

#include "BinaryReader.h"
#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/io/ByteArrayInputStream.h"
#include "java/io/IOException.h"
#include "java/lang/Integer.h"
#include "java/lang/Long.h"
#include "java/lang/StringBuilder.h"
#include "java/math/BigDecimal.h"
#include "java/util/ArrayList.h"
#include "java/util/Date.h"

@implementation ComUsOpenserverProtocolsBinaryReader

- (instancetype)initWithByteArray:(IOSByteArray *)buf {
  ComUsOpenserverProtocolsBinaryReader_initWithByteArray_(self, buf);
  return self;
}

- (jboolean)readBoolean {
  return 0 == (jbyte) [self read] ? false : true;
}

- (jbyte)readByte {
  return (jbyte) [self read];
}

- (IOSByteArray *)readBytes {
  jint length = [self readInt32];
  IOSByteArray *retVal = [IOSByteArray newArrayWithLength:length];
  [self readWithByteArray:retVal withInt:0 withInt:length];
  return retVal;
}

- (JavaUtilDate *)readDateTime {
  jlong TICKS_AT_EPOCH = 621355968000000000LL;
  jlong TICKS_PER_MILLISECOND = 10000;
  jlong ticks = [self readLong];
  JavaUtilDate *date = new_JavaUtilDate_initWithLong_((ticks - TICKS_AT_EPOCH) / TICKS_PER_MILLISECOND);
  return date;
}

- (JavaUtilDate *)readNullableDateTime {
  if ([self readBoolean]) return [self readDateTime];
  else return nil;
}

- (JavaLangLong *)readNullableTimeSpan {
  if ([self readBoolean]) return JavaLangLong_valueOfWithLong_([self readLong]);
  else return nil;
}

- (JavaMathBigDecimal *)readDecimal {
  return new_JavaMathBigDecimal_initWithLong_([self readLong]);
}

- (jshort)readInt16 {
  jshort retVal = (jshort) [self read];
  retVal |= JreLShift32([self read], 8);
  return retVal;
}

- (jint)readInt32 {
  jint retVal = [self read];
  retVal |= JreLShift32([self read], 8);
  retVal |= JreLShift32([self read], 16);
  retVal |= JreLShift32([self read], 24);
  return retVal;
}

- (IOSIntArray *)readInt32s {
  jint count = [self readInt32];
  IOSIntArray *retVal = [IOSIntArray newArrayWithLength:count];
  for (jint i = 0; i < count; i++) *IOSIntArray_GetRef(retVal, i) = [self readInt32];
  return retVal;
}

- (jlong)readLong {
  jlong retVal = [self read];
  retVal |= JreLShift32([self read], 8);
  retVal |= JreLShift32([self read], 16);
  retVal |= (jlong) 0x00000000FF000000LL & (JreLShift32([self read], 24));
  retVal |= (jlong) 0x000000FF00000000LL & (JreLShift64((jlong) [self read], 32));
  retVal |= (jlong) 0x0000FF0000000000LL & (JreLShift64((jlong) [self read], 40));
  retVal |= (jlong) 0x00FF000000000000LL & (JreLShift64((jlong) [self read], 48));
  retVal |= (jlong) 0xFF00000000000000LL & (JreLShift64((jlong) [self read], 56));
  return retVal;
}

- (NSString *)readString {
  jint nextCharValue = [self read];
  if (nextCharValue != -1) {
    JavaLangStringBuilder *s = new_JavaLangStringBuilder_init();
    jboolean lengthKeepGoing = (nextCharValue & (JreLShift32(1, 7))) == (JreLShift32(1, 7));
    JavaUtilArrayList *lengths = new_JavaUtilArrayList_init();
    [lengths addWithId:JavaLangInteger_valueOfWithInt_(nextCharValue & (jint) 0x7F)];
    while (lengthKeepGoing) {
      nextCharValue = [self read];
      lengthKeepGoing = ((nextCharValue & (JreLShift32(1, 7))) == (JreLShift32(1, 7)));
      [lengths addWithId:JavaLangInteger_valueOfWithInt_(nextCharValue & ((jint) 0x7F))];
    }
    jint totalLength = 0;
    for (jint i = 0; i < [lengths size]; i++) totalLength += JreLShift32([((JavaLangInteger *) nil_chk([lengths getWithInt:i])) intValue], (7 * i));
    for (jint i = 0; i < totalLength; i++) (void) [s appendWithChar:(jchar) [self read]];
    return [s description];
  }
  return nil;
}

- (jint)readUInt16 {
  jint retVal = [self read];
  retVal |= JreLShift32([self read], 8);
  return retVal;
}

- (IOSIntArray *)readUInt16s {
  jint count = [self readInt32];
  IOSIntArray *retVal = [IOSIntArray newArrayWithLength:count];
  for (jint i = 0; i < count; i++) *IOSIntArray_GetRef(retVal, i) = [self readUInt16];
  return retVal;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithByteArray:", "BinaryReader", NULL, 0x1, NULL, NULL },
    { "readBoolean", NULL, "Z", 0x1, NULL, NULL },
    { "readByte", NULL, "B", 0x1, NULL, NULL },
    { "readBytes", NULL, "[B", 0x1, NULL, NULL },
    { "readDateTime", NULL, "Ljava.util.Date;", 0x1, NULL, NULL },
    { "readNullableDateTime", NULL, "Ljava.util.Date;", 0x1, NULL, NULL },
    { "readNullableTimeSpan", NULL, "Ljava.lang.Long;", 0x1, NULL, NULL },
    { "readDecimal", NULL, "Ljava.math.BigDecimal;", 0x1, NULL, NULL },
    { "readInt16", NULL, "S", 0x1, NULL, NULL },
    { "readInt32", NULL, "I", 0x1, NULL, NULL },
    { "readInt32s", NULL, "[I", 0x1, NULL, NULL },
    { "readLong", NULL, "J", 0x1, NULL, NULL },
    { "readString", NULL, "Ljava.lang.String;", 0x1, "Ljava.io.IOException;", NULL },
    { "readUInt16", NULL, "I", 0x1, NULL, NULL },
    { "readUInt16s", NULL, "[I", 0x1, NULL, NULL },
  };
  static const J2ObjcClassInfo _ComUsOpenserverProtocolsBinaryReader = { 2, "BinaryReader", "com.us.openserver.protocols", NULL, 0x1, 15, methods, 0, NULL, 0, NULL, 0, NULL, NULL, NULL };
  return &_ComUsOpenserverProtocolsBinaryReader;
}

@end

void ComUsOpenserverProtocolsBinaryReader_initWithByteArray_(ComUsOpenserverProtocolsBinaryReader *self, IOSByteArray *buf) {
  JavaIoByteArrayInputStream_initWithByteArray_(self, buf);
}

ComUsOpenserverProtocolsBinaryReader *new_ComUsOpenserverProtocolsBinaryReader_initWithByteArray_(IOSByteArray *buf) {
  ComUsOpenserverProtocolsBinaryReader *self = [ComUsOpenserverProtocolsBinaryReader alloc];
  ComUsOpenserverProtocolsBinaryReader_initWithByteArray_(self, buf);
  return self;
}

ComUsOpenserverProtocolsBinaryReader *create_ComUsOpenserverProtocolsBinaryReader_initWithByteArray_(IOSByteArray *buf) {
  return new_ComUsOpenserverProtocolsBinaryReader_initWithByteArray_(buf);
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComUsOpenserverProtocolsBinaryReader)
