//
//  ViewController.m
//  AgendaDeContatosAlura
//
//  Created by Leonardo Gouveia on 17/08/17.
//  Copyright © 2017 Leonardo Gouveia. All rights reserved.
//

#import "ViewController.h"
#import "Contato.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithCoder: (NSCoder *) aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.contatoDao = [ContatoDao contatoDaoInstance];
        
    }
    return self;
}


- (void)populaInformacoes {
    self.nome.text = self.contato.nome;
    self.telefone.text = self.contato.telefone;
    self.endereco.text = self.contato.endereco;
    self.email.text = self.contato.email;
    self.site.text = self.contato.site;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem* botao = nil;
    
    if (self.contato) {
        botao = [[UIBarButtonItem alloc]
                 initWithTitle:@"Alterar"
                 style:UIBarButtonItemStylePlain
                 target:self
                 action:@selector(altera)];
        
        [self populaInformacoes];
        
    } else {
        botao = [[UIBarButtonItem alloc]
                 initWithTitle:@"Adicionar"
                 style:UIBarButtonItemStylePlain
                 target:self
                 action:@selector(adiciona)];
    }
    
    self.navigationItem.rightBarButtonItem = botao;
    self.navigationItem.title = @"Novo Contato";
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)pegaContatoDoForm {
    self.contato.nome = self.nome.text;
    self.contato.endereco = self.endereco.text;
    self.contato.email = self.email.text;
    self.contato.telefone = self.telefone.text;
    self.contato.site = self.site.text;
}

- (void)adiciona {
    self.contato = [Contato new];
    
    [self pegaContatoDoForm];
    
    [self.contatoDao adicionaContato:self.contato];
    
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [self.delegate contatoAdicionado:self.contato];
}

- (void)altera {
    [self pegaContatoDoForm];
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [self.delegate contatoAtualizado:self.contato];

}
@end
