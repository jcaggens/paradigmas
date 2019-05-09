vitima(anita).
insano(adriano).
insano(maria).
pobre(bernardo).
pobre(bia).
pobre(pedro).
pobre(maria).

relacionamento(anita, bernardo).
relacionamento(caren, bernardo).
relacionamento(anita, pedro).
relacionamento(alice, pedro).
relacionamento(alice, henrique).
relacionamento(maria, henrique).
relacionamento(maria, adriano).
relacionamento(caren, adriano).

lugar(pedro, sm, segunda).
lugar(pedro, sm, terca).
lugar(pedro, poa, quarta).
lugar(pedro, sm, quinta).
lugar(pedro, ap, sexta).
lugar(caren, poa, segunda).
lugar(caren, poa, terca).
lugar(caren, poa, quarta).
lugar(caren, sm, quinta).
lugar(caren, ap, sexta).
lugar(henrique, ap, segunda).
lugar(henrique, poa, terca).
lugar(henrique, ap, quarta).
lugar(henrique, ap, quinta).
lugar(henrique, ap, sexta).
lugar(bia, ap, segunda).
lugar(bia, poa, terca).
lugar(bia, poa, quarta).
lugar(bia, sm, quinta).
lugar(bia, ap, sexta).
lugar(adriano, sm, quarta).
lugar(adriano, ap, segunda).
lugar(adriano, ap, terca).
lugar(adriano, ap, quinta).
lugar(adriano, ap, sexta).
lugar(alice, ap, segunda).
lugar(alice, poa, terca).
lugar(alice, poa, quarta).
lugar(alice, ap, quinta).
lugar(alice, ap, sexta).
lugar(bernardo, sm, segunda).
lugar(bernardo, sm, terca).
lugar(bernardo, poa, quarta).
lugar(bernardo, sm, quinta).
lugar(bernardo, ap, sexta).
lugar(maria, ap, segunda).
lugar(maria, sm, terca).
lugar(maria, sm, quarta).
lugar(maria, sm, quinta).
lugar(maria, ap, sexta).

lugar(anita, ap, quinta).
lugar(anita, ap, sexta).

objeto(bastao, poa, quinta).
objeto(bastao, sm, quarta).
objeto(martelo, ap, quarta).
objeto(martelo, ap, quinta).

key(sm, segunda).
key(poa, terca).

ciume(X) :- relacionamento(anita, Y), relacionamento(X, Y).

paradeiro(X) :- lugar(X, ap, Z), lugar(anita, ap, Z).
arma(X) :- lugar(X, Y, Z), objeto(_, Y, Z).
chave(X) :- lugar(X, Y, Z), key(Y, Z).

acesso(X) :- arma(X), chave(X), paradeiro(X).

motivo(X) :- insano(X); pobre(X); ciume(X).

assassino(X) :- motivo(X), acesso(X), !.
