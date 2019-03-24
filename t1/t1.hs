import Data.Char (isDigit)
import Data.Char (toLower)

-- 1.Crie uma função isVowel :: Char -> Bool que verifique se um caracter é uma vogal ou não.
isVowel :: Char -> Bool
isVowel letra = if (letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u') then True else False

-- 2.Escreva uma função addComma, que adicione uma vírgula no final de cada string contida numa lista.
addComma :: [String] -> [String]
addComma list = map (\s -> s++",") list

-- 3.Crie uma função htmlListItems :: [String] -> [String], que receba uma lista de strings e retorne outra lista contendo as strings formatadas como itens de lista em HTML. Resolva este exercício COM e SEM funções anônimas (lambda).
-- anon
htmlListItems :: [String] -> [String]
htmlListItems list = map (\s -> "<LI>" ++ s ++ "</LI>") list

-- nao anon
addHtml :: String -> String
addHtml s = "<LI>"++s++"</LI>"

htmlListItems2 :: [String] -> [String]
htmlListItems2 list = map addHtml list

-- 4.Defina uma função que receba uma string e produza outra retirando as vogais, conforme os exemplos abaixo. Resolva este exercício COM e SEM funções anônimas (lambda).

-- anon
noVog :: String -> String
noVog list = filter (\letra -> (if (letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u') then False else True)) list

-- nao anon
noVog2 :: String -> String
noVog2 list = filter (not . isVowel) list

--5. Defina uma função que receba uma string, possivelmente contendo espaços, e que retorne outra string substituindo os demais caracteres por '-', mas mantendo os espaços. Resolva este exercício COM e SEM funções anônimas (lambda).

-- anon
alteraCarac :: String -> String
alteraCarac frase = map (\c -> if c /= ' ' then '-' else c) frase

-- nao anon
alteraCarac2 :: String -> String
alteraCarac2 frase = alteraCarac frase

--6.Escreva uma função firstName :: String -> String que, dado o nome completo de uma pessoa, obtenha seu primeiro nome. Suponha que cada parte do nome seja separada por um espaço e que não existam espaços no início ou fim do nome.

firstName :: String -> String
firstName nome = head (words nome)

--7.Escreva uma função isInt :: String -> Bool que verifique se uma dada string só contém dígitos de 0 a 9. 
isInt :: String -> Bool 
isInt = all isDigit

--8.Escreva uma função `lastName :: String -> String` que, dado o nome completo de uma pessoa, obtenha seu último sobrenome. Suponha que cada parte do nome seja separada por um espaço e que não existam espaços no início ou fim do nome.

lastName :: String -> String
lastName nome = last (words nome)

--9. Escreva uma função `userName :: String -> String` que, dado o nome completo de uma pessoa, crie um nome de usuário (login) da pessoa, formado por: primeira letra do nome seguida do sobrenome, tudo em minúsculas. 

userName :: String -> String
userName name = map toLower((( head(firstName name)) : lastName name))

--10.Escreva uma função encodeName :: String -> String que substitua vogais em uma string, conforme o esquema a seguir: a = 4, e = 3, i = 2, o = 1, u = 0.

encodeName :: String -> String
encodeName nome = map (\c -> (if (toLower c) == 'a' then '4' else if (toLower c) == 'e' then '3' else if (toLower c) == 'i' then '2' else if (toLower c) == 'o' then '1' else if (toLower c) == 'u' then '0' else c)) nome

--11. Escreva uma função betterEncodeName :: String -> String que substitua vogais em uma string, conforme este esquema: a = 4, e = 3, i = 1, o = 0, u = 00. 
codifica :: Char -> String
codifica c = if (toLower c) == 'a' then "4" else if (toLower c) == 'e' then "3" else if (toLower c) == 'i' then "1" else if (toLower c) == 'o' then "0" else if (toLower c) == 'u' then "00" else [c]

betterEncodeName :: String -> String
betterEncodeName nome = concatMap (\c -> codifica c) nome

--12. Dada uma lista de strings, produzir outra lista com strings de 10 caracteres, usando o seguinte esquema: strings de entrada com mais de 10 caracteres são truncadas, strings com até 10 caracteres são completadas com '.' até ficarem com 10 caracteres. 

tenLimit :: [String] -> [String]
tenLimit list = map (\p ->  if (length p) > 10 then (take 10 p) else (take 10 (p ++ ".........."))) list


