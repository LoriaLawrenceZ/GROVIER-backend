CREATE TABLE salas(
  id_sala serial NOT NULL,
  codigo varchar(16) NOT NULL,
  senha varchar(16) NOT NULL,
  CONSTRAINT pk_id_sala PRIMARY KEY (id_sala)
);

CREATE TABLE usuarios(
  id_usuario serial NOT NULL,
  nome varchar(255) NOT NULL,
  idade integer NOT NULL,
  email varchar(320) NOT NULL,
  senha varchar(32) NOT NULL,
  fk_id_sala integer NOT NULL,
  CONSTRAINT pk_id_usuario PRIMARY KEY (id_usuario),
  CONSTRAINT fk_id_sala FOREIGN KEY (fk_id_sala) REFERENCES salas(id_sala)
);

CREATE TABLE filmes(
  id_filme serial NOT NULL,
  nome varchar(255) NOT NULL,
  sinopse text NOT NULL,
  lancamento date NOT NULL,
  diretor varchar(255) NOT NULL,
  minutagem integer NOT NULL,
  CONSTRAINT pk_id_filme PRIMARY KEY (id_filme)
);

CREATE TABLE filmes_escolhidos(
  id_filme_escolhido serial NOT NULL,
  fk_id_usuario integer NOT NULL,
  fk_id_sala integer NOT NULL,
  fk_id_filme integer NOT NULL,
  CONSTRAINT pk_id_filme_escolhido PRIMARY KEY (id_filme_escolhido),
  CONSTRAINT fk_id_usuario FOREIGN KEY (fk_id_usuario) REFERENCES usuarios(id_usuario),
  CONSTRAINT fk_id_sala FOREIGN KEY (fk_id_sala) REFERENCES salas(id_sala),
  CONSTRAINT fk_id_filme FOREIGN KEY (fk_id_filme) REFERENCES filmes(id_filme)
);

CREATE TABLE series(
  id_serie serial NOT NULL,
  nome varchar(255) NOT NULL,
  sinopse text NOT NULL,
  lancamento date NOT NULL,
  encerramento date,
  minutagem integer NOT NULL,
  CONSTRAINT pk_id_serie PRIMARY KEY (id_serie)
);

CREATE TABLE episodios(
  id_episodio serial NOT NULL,
  nome varchar(255) NOT NULL,
  sinopse text NOT NULL,
  lancamento date NOT NULL,
  numero_episodio integer NOT NULL,
  numero_temporada integer NOT NULL,
  minutagem integer NOT NULL,
  fk_id_serie integer NOT NULL,
  CONSTRAINT pk_id_episodio PRIMARY KEY (id_episodio),
  CONSTRAINT fk_id_serie FOREIGN KEY (fk_id_serie) REFERENCES series(id_serie)
);

CREATE TABLE series_escolhidas(
  id_serie_escolhida serial NOT NULL,
  fk_id_usuario integer NOT NULL,
  fk_id_sala integer NOT NULL,
  fk_id_serie integer NOT NULL,
  CONSTRAINT pk_id_serie_escolhida PRIMARY KEY (id_serie_escolhida),
  CONSTRAINT fk_id_usuario FOREIGN KEY (fk_id_usuario) REFERENCES usuarios(id_usuario),
  CONSTRAINT fk_id_sala FOREIGN KEY (fk_id_sala) REFERENCES salas(id_sala),
  CONSTRAINT fk_id_serie FOREIGN KEY (fk_id_serie) REFERENCES series(id_serie)
);

CREATE TABLE generos(
  id_genero serial NOT NULL,
  nome varchar(255) NOT NULL,
  CONSTRAINT pk_id_genero PRIMARY KEY (id_genero)
);

CREATE TABLE midia_generos(
  id_midia_genero serial NOT NULL,
  fk_id_filme integer NOT NULL,
  fk_id_serie integer NOT NULL,
  fk_id_episodio integer NOT NULL,
  fk_id_genero integer NOT NULL,
  CONSTRAINT pk_id_midia_genero PRIMARY KEY (id_midia_genero),
  CONSTRAINT fk_id_filme FOREIGN KEY (fk_id_filme) REFERENCES filmes(id_filme),
  CONSTRAINT fk_id_serie FOREIGN KEY (fk_id_serie) REFERENCES series(id_serie),
  CONSTRAINT fk_id_episodio FOREIGN KEY (fk_id_episodio) REFERENCES episodios(id_episodio),
  CONSTRAINT fk_id_genero FOREIGN KEY (fk_id_genero) REFERENCES generos(id_genero)
);

CREATE TABLE atores(
  id_ator serial NOT NULL,
  nome varchar(255) NOT NULL,
  CONSTRAINT pk_id_ator PRIMARY KEY (id_ator)
);

CREATE TABLE midia_atores(
  id_midia_ator serial NOT NULL,
  fk_id_filme integer NOT NULL,
  fk_id_serie integer NOT NULL,
  fk_id_episodio integer NOT NULL,
  fk_id_ator integer NOT NULL,
  CONSTRAINT pk_id_midia_ator PRIMARY KEY (id_midia_ator),
  CONSTRAINT fk_id_filme FOREIGN KEY (fk_id_filme) REFERENCES filmes(id_filme),
  CONSTRAINT fk_id_serie FOREIGN KEY (fk_id_serie) REFERENCES series(id_serie),
  CONSTRAINT fk_id_episodio FOREIGN KEY (fk_id_episodio) REFERENCES episodios(id_episodio),
  CONSTRAINT fk_id_ator FOREIGN KEY (fk_id_ator) REFERENCES atores(id_ator)
);