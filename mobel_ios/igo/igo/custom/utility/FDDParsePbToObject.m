//
//  HPParseDataToObject.m
//  papm
//
//  Created by dean on 13-11-19.
//  Copyright (c) 2013年 pingan. All rights reserved.
//

#import "FDDParsePbToObject.h"
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

@implementation FDDParsePbToObject

/*
 将传过来的数据（dict,array,简单数据类型）转换成object
 */
+ (id) fromDataToObject:(id)data className:(Class)className
{
    if ([data isKindOfClass:[NSArray class]] || [data isKindOfClass:[NSMutableArray class]]) {//传入的是array
        NSMutableArray *resultarr = [[NSMutableArray alloc] init];
        for (int i=0; i<[(NSArray *)data count]; i++) {
            id value = [self fromDataToObject:[(NSArray *)data objectAtIndex:i] className:className];//递归，如果还是复杂类型，将一直递归到简单类型
            [resultarr addObject:value];
        }
        return resultarr;
    }else if([data isKindOfClass:[NSDictionary class]] || [data isKindOfClass:[NSMutableDictionary class]]){//传入的是dict
        id object = [[className alloc] init];
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList(className, &outCount);//获取该类的所有属性
        for (i=0; i<outCount; i++) {
            objc_property_t property = properties[i];
            NSString *propertyname = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];//获取properyname
            NSString *dictkeyname;//字典中的key的name
            if ([object respondsToSelector:@selector(propertyMapping:)]) {//如果实现了协议，则对象的属性和字典中的key有映射
                dictkeyname = [object performSelector:@selector(propertyMapping:) withObject:propertyname];//通过对象的属性名称获取字典中的key的名称。
            }
            id setValue;
            if (dictkeyname != nil) {
                setValue = [(NSDictionary *)data objectForKey:dictkeyname];//获取属性的值
            }else{
                setValue = [(NSDictionary *)data objectForKey:propertyname];//获取属性的值
            }
            if ([setValue isKindOfClass:[NSDictionary class]] || [setValue isKindOfClass:[NSMutableDictionary class]]) {//如果值是dict,表示仍然是复杂数据类型
                id propertyclass = objc_getClass(getPropertyType(property));//获取属性的class
                id value = [self fromDataToObject:setValue className:propertyclass];//递归，将复杂数据类型的值进行填充，将一直递归到简单数据类型
                [object setValue:value forKey:propertyname];//将递归返回的值填入属性
            }else if([setValue isKindOfClass:[NSArray class]] || [setValue isKindOfClass:[NSMutableArray class]]){//如果是array
                if ([object respondsToSelector:@selector(arrayTypeMapping:)]) {//获取array对应的复杂数据类型的class
                    Class class  = [object performSelector:@selector(arrayTypeMapping:) withObject:propertyname];//这里可能返回的是array也可能是复杂数据类型.
                    id value = [self fromDataToObject:setValue className:class];
                    [object setValue:value forKey:propertyname];
                }else{//如果array对应的类型没有在object中实现，抛出异常
                    [NSException raise:@"ArrayClassTypeMappingMethodException" format:@"Array Class Type has no specified!"];//中式英语，谢谢
                }
            }else{//值是简单数据类型，例如NSString和基础数据类型等，这里不像fromObjectToData，会存在自定义类型，因为json转化的过程中全部转化成了dict和array。
                if (setValue != nil) {
                    NSString *propertytype = [NSString stringWithCString:getPropertyType(property) encoding:NSUTF8StringEncoding];
                    //                    id propertyclass = objc_getClass(getPropertyType(property));
                    //                    if([propertyclass isKindOfClass:[NSString class]]){
                    //这个地方非常奇怪，明明propertyclass打印出来是NSString，但是使用if判断却返回的是NO。所以只好用下面这种判断方式了
                    if ([propertytype isEqualToString:@"NSString"]) {//这个地方必须这样处理一次，否则如果传进来的是NSNumber,但是我们定义的变量是NSString，在setValue之后，我们的变量会成为NSNubmer类型。这也是为什么上面两行代码被注释掉原因
                        [object setValue:[NSString stringWithFormat:@"%@",setValue] forKey:propertyname];//直接填充
                    }else{
                        [object setValue:setValue forKey:propertyname];//直接填充
                    }
                }
            }
        }
        free(properties);
        return object;
    }else{
        return data;
    }
}

/*
 将复杂对象转换成dict,arr
 在这里，我们需要进行递归循环，因为在dict和array中，有可能有复杂对象。我们需要将这些复杂对象转成dict
 */
+ (id) fromObjectToData:(id)object
{
    //如果是array类型
    if ([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSMutableArray class]]) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int i=0; i<[(NSArray *)object count]; i++) {
            [array addObject:[self fromObjectToData:[(NSArray *)object objectAtIndex:i]]];
        }
        return array;
    }else if([object isKindOfClass:[NSDictionary class]] || [object isKindOfClass:[NSMutableDictionary class]]){//如果是dict类型
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        NSArray *allkeys = [(NSDictionary *)object allKeys];
        for (int i=0; i<[allkeys count]; i++) {
            [dict setObject:[self fromObjectToData:[(NSDictionary *)object objectForKey:[allkeys objectAtIndex:i]]] forKey:[allkeys objectAtIndex:i]];
        }
        return dict;
    }else if([NSBundle bundleForClass:[object class]] == [NSBundle bundleForClass:self]){//判断这个类是不是我们的bundle中的类(目的就是为了判别是不是自定义类)
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList([object class], &outCount);//获取该类的所有属性
        for (i = 0; i < outCount; i++){
            objc_property_t property = properties[i];
            NSMutableString *property_Name = [NSMutableString stringWithFormat:@"%s",property_getName(property)];//获得属性的名称
            id property_Value = [object valueForKey:property_Name];
            NSString *dictkeyname;//字典中的key的name
            if([object respondsToSelector:@selector(propertyMapping:)]){//如果实现了协议，则对象的属性和字典中的key有映射
                dictkeyname = [object performSelector:@selector(propertyMapping:) withObject:property_Name];//通过对象的属性名称获取字典中的key的名称。
            }
            if (dictkeyname != nil) {
                [dict setObject:[self fromObjectToData:property_Value] forKey:dictkeyname];
            }else{
                [dict setObject:[self fromObjectToData:property_Value] forKey:property_Name];
            }
        }
        free(properties);
        return dict;
    }else{
        return object;
    }
}

#pragma mark 获取属性类型
static const char *getPropertyType(objc_property_t property) {
    const char *attributes = property_getAttributes(property);
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL) {
        if (attribute[0] == 'T') {
            if(attribute[1] == '@') {
                return (const char *)[[NSData dataWithBytes:(attribute + 3) length:strlen(attribute) - 4] bytes];
            } else {
                return (const char *)[[NSData dataWithBytes:(attribute + 1) length:strlen(attribute) - 1] bytes];
            }
        }
    }
    return "@";
}


@end
