//
//  ViewController.h
//  AgendaDeContatosAlura
//
//  Created by Leonardo Gouveia on 17/08/17.
//  Copyright © 2017 Leonardo Gouveia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDao.h"

@protocol ViewControllerDelegate <NSObject>

-(void)contatoAtualizado: (Contato*)contato;
-(void)contatoAdicionado: (Contato*)contato;


@end


@interface ViewController : UIViewController

-(id) initWithCoder:(NSCoder *)aDecoder;

@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *site;

@property ContatoDao* contatoDao;
@property Contato* contato;

@property id delegate;



@end

