# DynamicAnalyticalForwarding
动态解析转发机制

>动态方法解析： 
对象在收到无法解读的消息后，调用类方法+ (BOOL)resolveInstanceMethod:(SEL)sel来动态为其新增实例方法以处理该选择子。(如果尚未实现的方法是类方法，则调用+ (BOOL)resolveClassMethod:(SEL)sel)

/**
*  i(类型为int)
*  v(类型为void)
*  @(类型为id)
*  :(类型为SEL)
*/
