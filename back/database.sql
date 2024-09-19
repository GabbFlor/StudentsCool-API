-- Criação da tabela de administradores do site
create table adm_studentscool(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
)
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- criação da tabela de cadastro de escolas
create table cadastro_escolas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    localizacao VARCHAR(255) NOT null,
    contato_alt VARCHAR(255),
    qtd_alunos int(255) not null,
    dias_letivos VARCHAR(255) not null,
    observacoes VARCHAR(255),
    aprovado BOOLEAN default false
)
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Criação da tabela de contato
CREATE TABLE contato (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) not null,
    mensagem VARCHAR(350) NOT NULL,
    duvida_ou_alimentacao BOOLEAN,
    arquivo LONGBLOB
);


-- Criação tabela "users" de cada escola
create table users_escola_exemplo(
	id VARCHAR(255) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    cpf INT not null unique,
    telefone INT not null unique,
    authority ENUM('membro', 'cantina', 'admin') not null default 'membro'
)
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Tabela item de cardapio
create table cardapio_item(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    periodo ENUM('manha', 'almoco', 'tarde'),
    dia_da_semana ENUM('segunda', 'terca', 'quarta', 'quinta', 'sexta'),
    nome_comida VARCHAR(255) NOT NULL,
    tamanho_porcao INT NOT NULL
)
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Tabela de itens selecionados do cardapio (SEM CAMPO USUARIO)
create table cadapio_selecionados(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cardapio_item_id BIGINT NOT NULL,
    porcoes_escolhidas INT NOT NULL,

    FOREIGN KEY (cardapio_item_id) REFERENCES cardapio_item(id)
    ON DELETE CASCADE
)
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Tabela de itens selecionados do cardapio (COM O CAMPO DO USUARIO ADICIONADO)
-- Poderia ser usado para o usuario ver o que ele ja selecionou
create table cadapio_selecionados(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cardapio_item_id BIGINT NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    porcoes_escolhidas INT NOT NULL,

    FOREIGN KEY (cardapio_item_id) REFERENCES cardapio_item(id)
    ON DELETE CASCADE,

    FOREIGN KEY (user_id) REFERENCES users_escola_exemplo(id)
    ON DELETE CASCADE
)
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;



INSERT INTO cadastro_escolas (
    nome,
    email,
    localizacao,
    contato_alt,
    pre_cores,
    dias_letivos,
    horarios,
    observacoes,
    aprovado
) VALUES (
    'Escola do Futuro',
    'contato@escolado futuro.com',
    'Rua dos Exemplos, 123, Centro',
    '(11) 98765-4321',
    'Ensino Médio',
    3,
    'Azul e Branco',
    'Segunda a Sexta-feira',
    '07:00 - 12:20',
    'Escola com foco em tecnologia e inovação.',
    TRUE
);


