//
//  Contato.m
//  AgendaDeContatosAlura
//
//  Created by Leonardo Gouveia on 17/08/17.
//  Copyright © 2017 Leonardo Gouveia. All rights reserved.
//

#import "Contato.h"

@implementation Contato

- (NSString *)description {
    NSString *dados = [NSString stringWithFormat:@"Nome: %@ Endereço: %@ E-mail: %@ Site: %@ Telefone: %@", self.nome, self.endereco, self.email, self.site, self.telefone];
    return dados;
}

@end
