#import "FilmeService.h"
#import "Filme.h"

@implementation FilmeService

-(NSArray*) recuperaFilmes {
    
    NSMutableArray *filmes = [@[] mutableCopy];
    [filmes addObject: [self criarFilme:@"Primeiro Filme" comDescricao: @"Descricao para primeiro filme" comImagem: @"filme1.png"]];
    [filmes addObject: [self criarFilme:@"Segundo Filme" comDescricao: @"Descricao para segundo filme" comImagem: @"filme2.png"]];
    [filmes addObject: [self criarFilme:@"Terceiro Filme" comDescricao: @"Descricao para terceiro filme" comImagem: @"filme3.png"]];
    [filmes addObject: [self criarFilme:@"Quarto Filme" comDescricao: @"Descricao para quarto filme" comImagem: @"filme4.png"]];
    [filmes addObject: [self criarFilme:@"Quinto Filme" comDescricao: @"Descricao para quinto filme" comImagem: @"filme5.png"]];
    [filmes addObject: [self criarFilme:@"Sexto Filme" comDescricao: @"Descricao para sexto filme" comImagem: @"filme6.png"]];
    [filmes addObject: [self criarFilme:@"Sétimo Filme" comDescricao: @"Descricao para sétimo filme" comImagem: @"filme7.png"]];
    [filmes addObject: [self criarFilme:@"Oitavo Filme" comDescricao: @"Descricao para oitavo filme" comImagem: @"filme8.png"]];
    [filmes addObject: [self criarFilme:@"Nono Filme" comDescricao: @"Descricao para nono filme" comImagem: @"filme9.png"]];
    [filmes addObject: [self criarFilme:@"Décimo Filme" comDescricao: @"Descricao para décio filme" comImagem: @"filme10.png"]];
    return filmes;
}

-(Filme*) criarFilme: (NSString*) nome comDescricao: (NSString*) descricao comImagem: (NSString*) imagem {
    Filme* filme = [Filme new];
    filme.nome = nome;
    filme.descricao = descricao;
    filme.imagem = imagem;
    return filme;
}

@end
