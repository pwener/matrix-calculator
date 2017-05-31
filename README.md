# Matrix Calculator via Restful

## Master - Repository

Ligue o matrix-repository usando:

```
$ rails s
```

Entre na url http://localhost:3000/repository/read_all e perceba que ela estará vazia. Para preencher nosso repositório devemos usar o matrix-master, que irá requisitar o cadastro das tasks via pair_in, para isso execute o script `master.py`:

```
$ python3 master.py input/A.matrix A
```

Nesse exemplo `input/A.matrix` é o arquivo com a matriz A e `A` é só um indicador para falar que matriz se trata, entre A e B. O script irá mandar requests para nosso repository, você irá conferir isso entrando outra vez em: http://localhost:3000/repository/read_all

Após inserir todas suas pairs o master espera uma resposta lendo http://localhost:3000/repository/read_pair constantemente até que se tenha um número equivalente de hashs para formar uma matriz resultado. Claro que o resultado só irá ser retornado quando um outro master requisitar o cadastro de uma matriz B.

## Slave - Repository

Cada slave irá requisitar algo como http://localhost:3000/repository/read_pair/Ax tal que `Ax` pode ser qualquer elemento cadastrado no repository, de forma que os slaves irão pesquisar incrementalmente por um Ax, quando ele encontrar tanto um `Ax` quanto um `Bx` cadastrados no repository será dado o pair_out: http://localhost:3000/repository/pair_out/Ax

O slave deve calcular a nova linha e retornar o resultado ao repository via método POST pair_in, tal como o master faz, porém agora sua chave será:

key = Element(row:column)

Isso é só uma forma padronizada, como Ax e By para se descrever uma nova chave pair.
