# Master - Repository

Ligue o matrix-repository usando:

```
$ rails s
```

Entre na url http://localhost:3000/repository/read_all e perceba que ela estará vazia. Para preencher nosso repositório devemos usar o matrix-master, que irá requisitar o cadastro das tasks via pair_in, para isso execute o script `master.py`:

```
$ python3 master.py input/A.matrix A
```

Nesse exemplo `input/A.matrix` é o arquivo com a matriz A e `A` é só um indicador para falar que matriz se trata, entre A e B. O script irá mandar requests para nosso repository, você irá conferir isso entrando outra vez em: http://localhost:3000/repository/read_all

# Repository - Client
