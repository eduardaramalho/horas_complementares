## Aplicativo para registro de horas complementares dos alunos da Católica de Santa Catarina

O objetivo do aplicativo Registro de Atividades Complementares (RAC) é fornecer uma plataforma onde os alunos possam registrar suas atividades complementares, anexar comprovantes e solicitar a validação dessas atividades. O sistema visa simplificar o processo, centralizando as informações em um único local, tornando a gestão das atividades mais rápida, organizada e eficiente em comparação ao método manual utilizado atualmente.

## Utilização da aplicação

1. O usuário acessa o aplicativo e faz login com usuário e senha.
2. Ao logar, o usuário terá a possibilidade de pesquisar seus cursos inseridos e a quantidade de horas que pode validar, gerando relatório para acompanhamento. O sistema deve indicar no dashboard quantas horas faltam.  
3. O usuário pode inserir um certificado, incluindo o título do curso, a duração e um arquivo (pdf, png, jpg) do curso realizado, onde o sistema irá computar as horas restantes para que ele termine essa atividade.

## Requisitos funcionais

1. Deverá utilizar um sistema de login;
2. Deverá permitir o usuário visualizar a lista de atividades já envidas, incluindo detalhes como data de envio, descrição da atividade e status;
3. Deverá permitir o usuário visualizar quantas horas de atividade ainda faltam para completar os requisitos;
4. Deverá permitir o usuário cadastrar uma nova atividade, incluindo campos para descrição, data, tipo de atividade e duração.

## Requisitos não funcionais

1. Deverá suportar iOS e Android;
2. Deverá utilizar a versão mais recente do Flutter;
3. Deverá utilizar uma arquitetura escalável, modular e eficiente;
4. Deverá utilizar o Firebase;
5. Deverá ser implementado práticas de integração e entrega contínua (CI/CD);
6. Deverá ser otimizado para garantir tempos de resposta rápidos e uma experiência fluída para o usuário;
7. Deverá ser projetado com uma interface amigavél e intuitiva, garantindo usabilidade para diferentes níveis de habilidade tecnologócia.

## Arquitetura do projeto

Este projeto utiliza uma arquitetura modularizada, onde as responsabilidades estão organizadas em módulos como auth, home e user. Dentro de cada módulo, as camadas estão divididas em data, domain e presenter, seguindo o padrão Clean Architecture. A pasta core contém elementos reutilizáveis, como contratos, rotas e serviços gerais. O aplicativo utiliza o json-server para simular uma API REST, que está alocada no próprio projeto, permitindo acesso a dados por meio de endpoints RESTful.

