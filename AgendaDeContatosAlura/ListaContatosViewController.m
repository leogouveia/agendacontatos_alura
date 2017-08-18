//
//  ListaContatosViewController.m
//  AgendaDeContatosAlura
//
//  Created by Leonardo Gouveia on 17/08/17.
//  Copyright © 2017 Leonardo Gouveia. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "ViewController.h"
#import "Contato.h"

@implementation ListaContatosViewController

- (id)init {
    self = [super init];
    UIBarButtonItem *botaoForm = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
    self.navigationItem.rightBarButtonItem = botaoForm;
    self.navigationItem.title = @"Contatos";
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    
    
    self.contatoDao = [ContatoDao contatoDaoInstance];
    
    return self;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        [self deletaContato: indexPath];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Contato* contato = [self.contatoDao contatoDoIndice:indexPath.row];
    self.contatoSelecionado = contato;
    [self exibeFormulario];
}

- (void)deletaContato:(NSIndexPath*) indexPath {
    Contato* contato = [self.contatoDao contatoDoIndice:indexPath.row];
    
    [self.contatoDao removeContato: contato];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contatoDao.contatos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* identificador = @"Celula";
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:identificador];
    
    if(!cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:identificador];
    }
        
    Contato* contato = self.contatoDao.contatos[indexPath.row];
    cell.textLabel.text = contato.nome;
    
    return cell;
}


- (void)viewDidAppear:(BOOL)animated {
    [self.tableView reloadData];
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:(NSInteger)self.linhaSelecionada inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    self.linhaSelecionada =  -1;
}


- (void) exibeFormulario {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *form = [storyboard instantiateViewControllerWithIdentifier:@"Form-Contato"];
    form.delegate = self;
    //form.contatoDao = self.contatoDao;
    if (self.contatoSelecionado) {
        form.contato = self.contatoSelecionado;
    }
    
    self.contatoSelecionado = nil;
    
    
    [self.navigationController pushViewController:form animated:YES];
}

- (void)contatoAdicionado: (Contato*)contato {
    self.linhaSelecionada = [self.contatoDao indiceDoContato:contato];
    
    [self mostraAlerta:@"Adiciona" nomeContato:contato.nome];
    NSLog(@"Adicionado: %@", contato);
}

- (void)contatoAtualizado: (Contato*)contato {
    self.linhaSelecionada = [self.contatoDao indiceDoContato:contato];
    [self mostraAlerta:@"Atualiza" nomeContato:contato.nome];
    NSLog(@"Atualizado: %@", contato);
}

- (void)mostraAlerta: (NSString*)acao
         nomeContato:(NSString*)nomeContato  {
    
    
    
    NSString* acaoGerundio = nil;
    if([[acao lowercaseString] isEqual: @"adiciona"])
        acaoGerundio = @"adicionado";
    else if([[acao lowercaseString]  isEqual: @"atualiza"])
        acaoGerundio = @"atualizado";
    
    NSString* titulo = [NSString stringWithFormat:@"Contato %@", acaoGerundio];
    
    NSString* mensagem = [NSString stringWithFormat:@"Contato %@ %@ com sucesso!", nomeContato, acaoGerundio];
    
    UIAlertController* alerta = [UIAlertController
                                 alertControllerWithTitle:titulo
                                 message:mensagem
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    
    [alerta addAction:ok];
    
    [self presentViewController:alerta animated:YES completion:nil];
    

}

@end
