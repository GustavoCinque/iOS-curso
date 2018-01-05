//
//  AsyncDownloadImageView.m
//  Carros Aula
//
//  Created by Cast Group on 04/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import "AsyncDownloadImageView.h"

@implementation AsyncDownloadImageView{
    UIActivityIndicatorView *_loading;
    NSOperationQueue *_queue;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self exibirLoadingViewCriado];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self exibirLoadingViewCriado];
    }
    return self;
}

- (void) exibirLoadingViewCriado {
    _loading = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:_loading];
}

- (void) layoutSubviews {
    [super layoutSubviews];
    _loading.center = [self convertPoint:self.center toView:self.superview];
}

- (void)setUrlFoto:(NSString *)urlFoto {
    if(urlFoto || urlFoto.length > 0) {
        if(urlFoto != _urlFoto) {
            _urlFoto = [urlFoto copy];
            self.image = nil;
            
            if(!_queue)
                _queue = [[NSOperationQueue alloc] init];
            
            [_queue cancelAllOperations];
            [_loading startAnimating];
            [_queue addOperation:[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(recuperaImagem) object:nil]];
            
        }
    } else {
        _urlFoto = nil;
        self.image = nil;
    }
}

- (void) recuperaImagem {
    NSString *formatada = [self formatarUrlFoto:self.urlFoto];
    NSString *appendida = [@"/Documents/" stringByAppendingString:formatada];
    NSString *stringWithString =[NSString stringWithString:appendida];
    NSString *stringFile = [NSHomeDirectory() stringByAppendingString:stringWithString];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:stringFile]) {
        NSData *data = [NSData dataWithContentsOfFile:stringFile];
        if(data) {
            UIImage *img = [UIImage imageWithData:data];
            [self performSelectorOnMainThread:@selector(apresentaImagem:) withObject:img waitUntilDone:YES];
        }
    }
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.urlFoto]];
    UIImage *imagem = [UIImage imageWithData:data];
    if(imagem) {
        [data writeToFile:stringFile atomically:YES];
        [self performSelectorOnMainThread:@selector(apresentaImagem:) withObject:imagem waitUntilDone:YES];
    }
    
}

- (void) apresentaImagem: (UIImage*) img {
    self.image = img;
    [_loading stopAnimating];
}

- (NSString*) formatarUrlFoto: (NSString*) urlFoto {
    return [[[[[[self.urlFoto stringByReplacingOccurrencesOfString:@"/" withString:@"_"]
        stringByReplacingOccurrencesOfString:@"//" withString:@"_"]
        stringByReplacingOccurrencesOfString:@":" withString:@"_"]
        stringByReplacingOccurrencesOfString:@"\n" withString:@"_"]
        stringByReplacingOccurrencesOfString:@"\t" withString:@"_"]
        stringByReplacingOccurrencesOfString:@"\r" withString:@"_"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
