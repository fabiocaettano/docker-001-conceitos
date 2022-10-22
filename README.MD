# Iniciativa DevOps

## Instalar

Instalar no Ubuntu 20.04:

``` cli
curl -fsSL https://get.docker.com | bash
usermod -aG docker jenkins
```

## Criar o Container

1. Criar um container hello-world.
Se o parameto "--name" não for informado será gerado um nome randonicamente.

``` bash
docker container run hello-world --name meucontainer
```

## Listar Containers
1. Exibir container em execução:

``` bash
docker container ls 
```

2. Exibir container que não estão em execução:

``` bash
docker container ls -a
```

## Exluir Containers 

1. Excluir o container pelo nome ou id:

``` bash
docker container rm idDoContainer
```

2. É possivel excluir o container com os três primeiros digitos do id do container:

``` bash
docker container ls 
```

3. Excluir um container apos sua execução:
``` bash
docker container run --rm hello-wrold
```


4. Um container em execução não poderá ser excluido, a não ser que ele seja interrompido ou forçe o destruição:

Interromper:

``` bash
docker container stop idDoContainer
docker container rm idDoContainer
```

Forçando:
``` bash
docker container rm -f idDoContainer
```

5. Excluido todos os containers:

Lista do Id dos containers:

``` bash
docker container ls -a -q
```

Excluindo:

``` bash
docker container rm -f $(docker container ls -aq)
```

Excluindo containers que não estão sendo utilizados:

``` bash
docker containe prune
```




## Modo Interativo e Execução

1. Acessar o container de forma interativa:

``` bash
docker container run -it ubuntu /bin/bash 
```

2. Acessar o container que está em execução:

```
docker execc -it idDoContainer /bin/bash
```


## NGINX

1. Criar um container com a imagem do Nginx:

Observe que o ambiente esta em execução, mas não há como interagir.

``` bash
docker container run nginx
```

Para interromper o container utilize as teclas CTRL + C.


2. Para liberar o teclado o container deve ser criado com a flag "-d"

``` bash
docker container run -d nginx 
docker container ls
```

3. Acessar o container em execução:

```
docker exec -it idDoContainer /bin/bash

curl https://www.google.com
```

4. Acessar pelo Browser.

A porta 8080 é local, será direcionada para porta 80 do container.

``` bash
docker container run -d -p 8080:80 nginx
```

Browser:

``` html
http://ipDaVm:8080
```


## POSTGREE

1. Criar o container com bancod de dados PostGree:

``` bash
docker container run -d -p 5432:5432 -e POSTGRES_DB=aula -e POSTGRES_USER=iniciativadevops -e POSTGRES_PASSWORD=Iniciativa1234 postgres
```

2. Na maqunian utilize o aplicatico DBeaver CE, ele é uma aplictivo para acessar diversas bases de dados.

3. Destruir o container:
```
docker container ls
docker-container rm -f idDoContainer
```

## DockerFile

O Dockerfile é como se fosse uma receita para criação das imagens.

O FROM sinaliza qual imagem vai ser criada.
O RUN executa comandos no bash do container.
Mas ha outros comandos utilizados no Dockerfile: W

Cada linha é uma camada (somente leitura), e o container agrupa estas camadas e nele é possivel realizar leitura e escrita.

Assim a um reaproveitamento do Docker ao criar nova imagens, aproveita as camadas já criadas e ocorre otimização de espaços.

### Exemplo 1:

Neste primeiro exemplo será realizado um download do ubuntu e apos isso o repositório será atualizado, e na seququencia o ubuntu será instalado.

``` vim
FROM ubuntu
RUN apt update
RUN apt install curl --yes

```

Criar a imagem:

``` bash
docker container build -t ubuntu-with-curl:v2 .
``` 

Para visualizar as imagens:

``` bash
docker image ls
```

### Exemplo 2:

Será incluido a instrução pra instalar o vim.
Observe que as camadas serão reaproveitadas até chegar o ponto de instalação do vim.

``` vim
FROM ubuntu
RUN apt update
RUN apt install curl --yes
RUN apt install vim --yes 
```

Criar a imagem:

``` bash
docker container build -t ubuntu-with-curl:v3 .
```

Para visualizar as imagens:

``` bash
docker image ls
```



### Exemplo 3:

Observe que a criação da imagem será muito mais rápida, devido o reaproveitamento das camadas:

``` bash
docker container build -t ubuntu-with-curl:v4 .
```

### Exemplo 4: 

Mas a casos que é necessário não reaproveitar as camadas, ou seja não utilizar o cache.

```
docker build -t ubunutu-with-curl:v5 . --no-cache
```

### Exemplo 5:

A casos que é melhor utilizados os comandos de forma combinada:

``` Dockerfile
FROM ubuntu
RUN apt update && \
    apt install curl --yes && \
    apt install vim --yes	
```

Executar:

```
docker build -t ubuntu-with-curl:v6 .
```


## Excluindo Imagens

Exemplos para excluir imagens:

``` bash
docker image rm idDaImagem
docker image rm -f idDaImagem
docker image rm -f $(docker image ls -aq)
```

Excluindo imagens não utilizadas:

```
docker image prune
```


## Docker Register



