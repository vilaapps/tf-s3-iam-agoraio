# Provisionamento S3 + IAM para gravações agora.io (Ambiente DEV)

Este projeto em Terraform provisiona:

- Um bucket S3 com política de lifecycle (DEEP_ARCHIVE após 15 dias)
- Um usuário IAM com permissões específicas para gravações
- Geração de `access_key` e `secret_key` para integração com agora.io

## Pré-requisitos

- AWS CLI instalado e configurado
- Terraform instalado (versão >= 1.3.0)
- Perfil AWS configurado localmente via `aws configure`

## Estrutura do Projeto

.
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│   ├── s3_recordings/
│   └── iam_recorder_user/

## Variáveis principais

As variáveis estão no arquivo `variables.tf` na raiz do projeto.

| Variável         | Descrição                             | Exemplo                     |
|------------------|----------------------------------------|-----------------------------|
| `aws_profile`    | Nome do perfil AWS no seu computador   | `"meu-perfil-aws"`          |
| `region`         | Região dos recursos na AWS             | `"us-east-1"`               |
| `environment`    | Ambiente (ex: `dev`, `prod`)           | `"dev"`                     |
| `bucket_name`    | Nome do bucket S3                      | `"agoraio-recordings-dev"`  |
| `iam_user_name`  | Nome do usuário IAM                    | `"agoraio-recorder"`        |
| `days_to_glacier`| Dias até mover objetos para arquivo    | `15`                        |
| `storage_class`  | Classe de storage de destino           | `"DEEP_ARCHIVE"`            |

Você pode ajustar qualquer valor diretamente no `variables.tf` antes de rodar o Terraform.  
Por exemplo, para alterar o perfil AWS que será usado, basta mudar o valor de `aws_profile` — isso será refletido automaticamente no `provider.tf`.

## Como aplicar

1. Clone o repositório

```
git clone <URL_DO_REPO>
cd <pasta>
```

2. Ajuste os valores desejados no `variables.tf`

3. Rode os comandos Terraform:

```
terraform init
terraform apply
```

## O que será exibido após o apply

- Nome do bucket S3 criado
- Nome do usuário IAM
- `access_key_id` e `secret_access_key` para integração com a agora.io
- Para visualizar a `secret_access_key` após o `apply`, use o comando: terraform output secret_access_key

## Verificações recomendadas no Console AWS

- S3 → Bucket: verifique a aba “Management” → Lifecycle → DEEP_ARCHIVE após 15 dias
- IAM → Users: confirme a existência do usuário e as permissões aplicadas
- Chaves IAM: guarde a secret gerada após o apply (ela não será exibida novamente)

## Observação

Este projeto está configurado inicialmente para o ambiente `dev`, mas pode ser facilmente adaptado para `prod` alterando os valores das variáveis no `variables.tf`.
