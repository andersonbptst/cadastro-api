# Projeto: Cadastro

Objetivo desse projeto é criar uma API de cadastro utilizando o CSM strapi, virtualizando os serviços em docker e instalar em um cluster utilizando kubernetes.

## Visão macro do projeto

Para auxiliar no entendimento da solução e desenvolvimento dos componentes, segue o diagrama abaixo:

![Screenshot](./_/macro.png)

## Deploy do projeto

Para seguir os passos abaixo, é necessário ter os softwares instalados e o ambiente de virtualização devidamente configurados!

```
# Criando o cluster...
kind create cluster --name cadastro-api-cluster --config=cadastro-api-cluster.yaml

# Criando o volume para o banco de dados...
kubectl apply -f ./database/postgres/storage/persistent-volume.yaml
kubectl apply -f ./database/postgres/storage/persistent-volume-claim.yaml

# Adicionando as credencias de acesso ao banco de dados...
kubectl apply -f ./database/postgres/postgres-secrets.yaml

# Aplicando o setup no banco de dados...
kubectl apply -f ./database/postgres/setup/postgres-setup-pod.yaml

# Publicando o banco de dados...
kubectl apply -f ./database/postgres/postgres-deployment.yaml
kubectl apply -f ./database/postgres/postgres-service.yaml

# Publicando a aplicação...
kubectl apply -f ./app/app-deployment.yaml
kubectl apply -f ./app/app-service.yaml
```

![Screenshot](./_/get_all.png)