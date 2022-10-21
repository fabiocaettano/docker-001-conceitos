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

``` bash
docker container run -d -p 5432:5432 -e POSTGRES_DB=aula -e POSTGRES_USER=iniciativadevops -e POSTGRES_PASSWORD=Iniciativa1234 postgres
```

DBeaver CE

