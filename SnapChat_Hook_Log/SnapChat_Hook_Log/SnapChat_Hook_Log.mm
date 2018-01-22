#line 1 "/Users/huig/Desktop/cs/Snapchat/SnapChat_Hook_Log/SnapChat_Hook_Log/SnapChat_Hook_Log.xm"




#import <UIKit/UIKit.h>

#include <logos/logos.h>
#include <substrate.h>
@class SCText; @class SCChat; @class NSMutableAttributedString; 
static void (*_logos_orig$_ungrouped$SCChat$receivedMessageAddedToChat$)(SCChat*, SEL, id); static void _logos_method$_ungrouped$SCChat$receivedMessageAddedToChat$(SCChat*, SEL, id); 
static __inline__ __attribute__((always_inline)) Class _logos_static_class_lookup$SCText(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SCText"); } return _klass; }static __inline__ __attribute__((always_inline)) Class _logos_static_class_lookup$NSMutableAttributedString(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("NSMutableAttributedString"); } return _klass; }
#line 7 "/Users/huig/Desktop/cs/Snapchat/SnapChat_Hook_Log/SnapChat_Hook_Log/SnapChat_Hook_Log.xm"



static void _logos_method$_ungrouped$SCChat$receivedMessageAddedToChat$(SCChat* self, SEL _cmd, id arg1) {
    
    NSLog(@"-[<SCChat: %p> receivedMessageAddedToChat:%@]", self, arg1); _logos_orig$_ungrouped$SCChat$receivedMessageAddedToChat$(self, _cmd, arg1);

    if ([arg1 isKindOfClass:[_logos_static_class_lookup$SCText() class]]){
        
        NSLog(@"发送的消息是:%@",[arg1 text]);

        NSString *text = [NSString stringWithFormat:@"你发送的消息是:%@",[arg1 text]];
        NSMutableAttributedString *attrString = [[_logos_static_class_lookup$NSMutableAttributedString() alloc] initWithString:text];
        NSUInteger length = [text length];
        UIFont *baseFont = [UIFont systemFontOfSize:15];
        [attrString addAttribute:NSFontAttributeName value:baseFont range:NSMakeRange(0, length)];
        id scText = [[_logos_static_class_lookup$SCText() alloc] initWithSender:[arg1 recipient] recipient:[arg1 sender] attributedText: attrString];
        
        
        [self sendText: scText completionHandler:^(){}];
        
    }
    
}



static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SCChat = objc_getClass("SCChat"); MSHookMessageEx(_logos_class$_ungrouped$SCChat, @selector(receivedMessageAddedToChat:), (IMP)&_logos_method$_ungrouped$SCChat$receivedMessageAddedToChat$, (IMP*)&_logos_orig$_ungrouped$SCChat$receivedMessageAddedToChat$);} }
#line 34 "/Users/huig/Desktop/cs/Snapchat/SnapChat_Hook_Log/SnapChat_Hook_Log/SnapChat_Hook_Log.xm"
