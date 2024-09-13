-- Criação da tabela de administradores do site
create table adm_studentscool(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
)
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci

-- criação da tabela de cadastro de escolas
create table cadastro_escolas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    localizacao VARCHAR(255) NOT null,
    contato_alt VARCHAR(255),
    lvl_ensino VARCHAR(255) not null,
    qtd_turma int(255) not null,
    pre_cores VARCHAR(255) not null,
    dias_letivos VARCHAR(255) not null,
    horarios VARCHAR(255) not null,
    metodo_nota VARCHAR(255) not null,
    observacoes VARCHAR(255),
    aprovado BOOLEAN default false
)
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Criação da tabela de contato
CREATE TABLE contato_msg_exemplo (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    mensagem TEXT NOT NULL
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
    nome_comida VARCHAR(255) NOT NULL,
    tamanho_porcao INT NOT NULL
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


