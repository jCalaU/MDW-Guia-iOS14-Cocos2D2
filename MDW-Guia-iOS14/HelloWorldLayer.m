//
//  HelloWorldLayer.m
//  MDW-Guia-iOS14
//
//  Created by Javier Cala Uribe on 24/10/11.
//  Copyright * 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init{
    
    // ccc4 Estable el color de Fondo
    if( (self=[super initWithColor:ccc4(255,255,255,255)] )) 
    {
        self.isTouchEnabled = YES;
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        // Crea un objeto tipo CCSprite que contiene la imagen agregada
        player = [CCSprite spriteWithFile:@"giftOne.png"
                            
                                               rect:CGRectMake(0, 0, 186, 186)];
        
        // Establece la posición del objeto
        player.position = ccp(player.contentSize.width/2, winSize.height/2);
        
        // Agrega el objeto a la Capa
        [self addChild:player];
        
    }
    
    return self;
}


-(void)moveObject {
    
    // Acción girar
    id rotateAction = [CCRotateBy actionWithDuration:2 angle:180*2];
    
    // Acción saltar
    id jumpAction = [CCJumpBy actionWithDuration:2 position:ccp(260,0) height:50 jumps:2];
    
    // Agrupa 2 o más acciones
    id fordward = [CCSpawn actions:rotateAction, jumpAction, nil];
    
    // Todas las acciones permiten regresar la acción con el método "reverse"
    id backwards = [fordward reverse];
    
    // Permite ejecutar una acción despúes de otra
    id sequence = [CCSequence actions: fordward, backwards, nil];
    
    // Repite una acción el número de veces que se requiera o
    // hasta el infinito y más allá con "RepearForEver"
    id repeat = [CCRepeat actionWithAction:sequence times:2];
    
    // Ejecuta la acción sobre el objeto
    [player runAction:repeat];
    
}

// Método que implementa el evento Touch en Cocos2D
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self moveObject];
    
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
