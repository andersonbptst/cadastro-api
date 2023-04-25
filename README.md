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

![Screenshot](./_/kubectl_get_all.png)

## Consumindo o serviço: Cadastro-API

### Listando todos os cadastros!

```
curl -X GET "http://localhost/api/cadastros" -H "Content-Type: application/json" -H "accept: application/json" -H "Authorization: Bearer cbeee95426714a2de3f64026d6c9b02c178f6414677be880590a640d04b0cf7ea2e51f8d36d0f8693629ad6b7412f40aaf19dce2212f304702fd22d92c427461e61ccf2c60acf8ca82ddb4b9314876d3e88d318781e4d2b7fb0e3813bd91121c1fc2b7ea62deab525fa5eca9248ebb73b2fad892bd801c584b28839147adc249"
```

![Screenshot](./_/lista_de_cadastro_vazia.png)

### Criando um novo cadastro!
```
curl -X POST "http://localhost/api/cadastros" -H "Content-Type: application/json" -d "{\"data\":{\"Nome\":\"Lucas da Silva\",\"Email\":\"lucas.silva@email.com\",\"CPF\":\"59827822039\"}}" -H "Authorization: Bearer cbeee95426714a2de3f64026d6c9b02c178f6414677be880590a640d04b0cf7ea2e51f8d36d0f8693629ad6b7412f40aaf19dce2212f304702fd22d92c427461e61ccf2c60acf8ca82ddb4b9314876d3e88d318781e4d2b7fb0e3813bd91121c1fc2b7ea62deab525fa5eca9248ebb73b2fad892bd801c584b28839147adc249"
```

![Screenshot](./_/novo_cadastro.png)

### Listando todos os cadastros novamente!

```
curl -X GET "http://localhost/api/cadastros" -H "Content-Type: application/json" -H "accept: application/json" -H "Authorization: Bearer cbeee95426714a2de3f64026d6c9b02c178f6414677be880590a640d04b0cf7ea2e51f8d36d0f8693629ad6b7412f40aaf19dce2212f304702fd22d92c427461e61ccf2c60acf8ca82ddb4b9314876d3e88d318781e4d2b7fb0e3813bd91121c1fc2b7ea62deab525fa5eca9248ebb73b2fad892bd801c584b28839147adc249"
```

![Screenshot](./_/lista_de_cadastro_apos_criacao.png)