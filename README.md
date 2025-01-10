# WayAirlines
Teste prático iOS SwiftUI


# Projeto Escopo 
-A aplicação foi desenvolvida em SwiftUI mantendo o padrão de projeto MVVM.
Também foi feita uma "Separação" dos packages buscando uma arquitetura um pouco mais limpa(principalmente em relação ao consumo da base de dados)


# Views
-A troca de views é gerenciada através de um enum + @State, assim é possívek controlar as views de forma isolada apenas passando um @Biding pra cada. 

-Utilizei um pattern de componentização das views, extendendo as classes e criando os componentes como variáveis, assim eles ficam isolados e ajuda na detecção e manutenção, isso também ajuda a reduzir as classes principais.

-O iphone 15 pro max e o SE2Gen foram usados como base para criação das telas, assim posso ajustar as views para responder na menor, e na maior tela disponível. Os componentes se encaixaram bem nos tamanhos adequados.

# Listagem
-As listas são feitas com base na View-Model, lá é feito os filtros e parâmetros responsáveis pelo controle.

-Dei preferência por utilizar ScrollView + LazyStack + ForEach, em vez de utilizar a lista simples do SwiftUI. Desta forma consigo carregar na memória apenas os itens que aparecem na tela, a base de dados tendo 20 ou 1000 itens, vai se comportar da mesma forma e evita que carregue muitos itens desnecessáriamente.

-Os filtros principais são controlados através de um picker + Switch. Assim dando acesso ao Status do objeto, mas também permitindo que eu crie lógicas para realizar os que envolvem Data.

-Os status do voo são destacados por cores, isso ajuda na taxonomia visual da lista.

-É possível pesquisar um item com base no ID.

# API
- A base de dados foi consumida simulando um consumo de API Rest, então se necessário alterar a fonte dos dados para uma API em funcionamento, pouca coisa deve ser mudada.

- O pacote Gateway é responsável por gerenciar os dados que podem entrar ou sair da aplicação. Neste caso a classe de acesso da API, e a classe do objeto de Response da API se encontram dentro desse pacote.

- Foi feita uma classe  pra converter o objeto reponse no objeto da model que eu queria utilizar, assim eu poderia ficar mais livre para utilizar os tipos de dados do Swift, não me limitando a trazer tudo como String.


- A classe de converter possui um método em sobrecarga para criação dos objetos, podendo ser feito 1 por vez ou em grupos de arrays (não fiz testes a fundo, mas ao que aparenta, funciona bem)

# View Model 

-A viewModel contém diversos métodos de converter ou adiquirir tipos de dados, e também é responsável alocar os 2 arrays principais que eu utilizei na aplicação, o primeiro pra carregar todos os itens quando a lista é colocada a vista, e outro para executar os filtros. Assim possibilitando alternar entre os filtros sem precisar chamar a api todo momento.

-Um desses métodos é responsável por chamar o método de fetch da API, ele é feito somente quando a view de listagem aparece, populando um vetor principal. Assim é possível evitar que a api seja chamada sem que a view apareça, isso é controlado devido ao onApear disponivel na lista.
 
