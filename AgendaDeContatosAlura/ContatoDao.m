//
//  ContatoDao.m
//  AgendaDeContatosAlura
//
//  Created by Leonardo Gouveia on 17/08/17.
//  Copyright © 2017 Leonardo Gouveia. All rights reserved.
//

#import "ContatoDao.h"

@implementation ContatoDao

static ContatoDao* defaultDao = nil;

-(id) init {
    self = [super init];
    if(self) {
        self.contatos = [NSMutableArray new];
    }
    return self;
}

+(ContatoDao *) contatoDaoInstance {
    if (!defaultDao) {
        defaultDao = [ContatoDao new];
    }
    return defaultDao;
}

-(void) adicionaContato:(Contato *)contato {
    [self.contatos addObject:contato];
}

-(void)removeContato:(Contato *)contato{
    [self.contatos removeObject:contato];
}

-(Contato *)contatoDoIndice:(NSInteger)index{
    return self.contatos[index];
}


-(NSInteger)total {

    return (NSInteger) self.contatos.count;
}

-(NSInteger)indiceDoContato:(Contato *)contato{
    return [self.contatos indexOfObject:contato];
}
@end
