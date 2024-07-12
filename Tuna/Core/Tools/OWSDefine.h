//
//  OWSDefine.h
//  Tuna
//
//  Created by mac on 2024/7/12.
//

#ifndef OWSDefine_h
#define OWSDefine_h

#import "OWSConstants.h"
#import "Masonry.h"


#define HEXCOLOR(hexValue)              [UIColor colorWithRed : ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0 green : ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0 blue : ((CGFloat)(hexValue & 0xFF)) / 255.0 alpha : 1.0]


#endif /* OWSDefine_h */
