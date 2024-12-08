# JSON Server

O **JSON Server** é uma ferramenta simples e leve que permite criar rapidamente uma API REST mock baseada em um arquivo JSON. Ideal para protótipos e testes rápidos.

## Pré-requisitos

- Node.js instalado

## Instalação

1. Instale o JSON Server globalmente com o npm:

   ```bash
   npm install -g json-server
   ```

## Como rodar

1. No terminal, vá até o diretório onde o arquivo `db.json` está localizado:

   ```bash
   cd /horas_complementares_api
   ```

2. Execute o seguinte comando para iniciar o servidor:

   ```bash
   json-server --watch db.json
   ```

3. Por padrão, o servidor estará disponível em:

   ```
   http://localhost:3000
   ```

4. No CMD, execute `ipconfig` e copie o IPV4:

   ```bash
   ipconfig
   ```

5. Com o IPV4 troque o a `BASE_URL` no `env/.env`, com a porta que esta sendo executado o `json-server`.

Você poderá acessar os dados do `db.json` através de endpoints RESTful.

## Configurações adicionais

- Para alterar a porta padrão:

  ```bash
  json-server --watch db.json --port 4000
  ```

- Para usar outro arquivo JSON como base:
  ```bash
  json-server --watch outro-arquivo.json
  ```

Para mais informações, consulte a [documentação oficial](https://github.com/typicode/json-server).
