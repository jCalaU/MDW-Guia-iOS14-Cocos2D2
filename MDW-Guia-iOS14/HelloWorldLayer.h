//
//  HelloWorldLayer.h
//  MDW-Guia-iOS14
//
//  Created by Javier Cala Uribe on 24/10/11.
//  Copyright * 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayerColor
{
    CCSprite *player;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
