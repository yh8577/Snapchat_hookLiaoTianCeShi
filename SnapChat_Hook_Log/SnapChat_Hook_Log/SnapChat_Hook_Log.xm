



#import <UIKit/UIKit.h>

%hook SCChat

// 接收
- (void)receivedMessageAddedToChat:(id)arg1 {
    
    %log; %orig;

    if ([arg1 isKindOfClass:[%c(SCText) class]]){
        
        NSLog(@"发送的消息是:%@",[arg1 text]);

        NSString *text = [NSString stringWithFormat:@"你发送的消息是:%@",[arg1 text]];
        NSMutableAttributedString *attrString = [[%c(NSMutableAttributedString) alloc] initWithString:text];
        NSUInteger length = [text length];
        UIFont *baseFont = [UIFont systemFontOfSize:15];
        [attrString addAttribute:NSFontAttributeName value:baseFont range:NSMakeRange(0, length)];
        id scText = [[%c(SCText) alloc] initWithSender:[arg1 recipient] recipient:[arg1 sender] attributedText: attrString];
        
        // 自动回复
        [self sendText: scText completionHandler:^(){}];
        
    }
    
}

%end

