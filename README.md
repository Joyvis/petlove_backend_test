# Petlove Backend Test

Aplicação para controle e clientes e seus respectivos pets

## Como utilizar

Após clonar o projeto na pasta de sua preferência, acesse a pasta raiz do projeto e execute os seguintes comandos:
<pre>
bundle install
rake db:create
rake db:migrate
rake db:seed
</pre>

### Testes

<pre>
rspec spec
</pre>

### Subir servidor da aplicação
<pre>
rails s
</pre>

Após o procedimento ser concluído, basta acessar o endereço `` http://localhost:3000/people `` através do seu navegador.

## Questões

### Qual é o custo médio dos animais do tipo cachorro?
<pre>
Animal.dogs.average(:monthly_cost)
</pre>

### Quantos cachorros existem no sistema?
<pre>
Animal.dogs.size
</pre>

### Qual o nome dos donos dos cachorros (Array de nomes)
<pre>
Animal.dogs.includes(:person).map(&:person).map(&:name)
</pre>

### Retorne as pessoas ordenando pelo custo que elas tem com os animais (Maior para menor)
<pre>
Person.all.sort_by(&:animals_monthly_cost).reverse
</pre>

### Levando em consideração o custo mensal, qual será o custo de 3 meses de cada pessoa?
<pre>
Person.all.map(&:animals_monthly_cost).map { |p| p * 3 }
</pre>

