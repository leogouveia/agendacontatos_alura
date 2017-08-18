//
//  ListaContatosViewController.h
//  AgendaDeContatosAlura
//
//  Created by Leonardo Gouveia on 17/08/17.
//  Copyright © 2017 Leonardo Gouveia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDao.h"
#import "ViewController.h"

@interface ListaContatosViewController : UITableViewController<ViewControllerDelegate>

@property ContatoDao *contatoDao;
@property Contato *contatoSelecionado;
@property NSInteger linhaSelecionada;

- (void)contatoAdicionado: (Contato*) contato;
- (void)contatoAtualizado: (Contato*) contato;

@end
