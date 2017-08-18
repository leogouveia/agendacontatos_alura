//
//  ContatoDao.h
//  AgendaDeContatosAlura
//
//  Created by Leonardo Gouveia on 17/08/17.
//  Copyright © 2017 Leonardo Gouveia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDao : NSObject

@property NSMutableArray *contatos;

-(Contato*) contatoDoIndice: (NSInteger) index;
-(void) adicionaContato: (Contato*) contato;
-(void) removeContato: (Contato*) contato;
-(NSInteger) total;
-(NSInteger) indiceDoContato: (Contato*) contato;

+ (ContatoDao*) contatoDaoInstance;

@end
