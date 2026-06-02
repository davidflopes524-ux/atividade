DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;
CREATE TABLE `usuarios` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `nome` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `telefone` VARCHAR(255) NOT NULL,
    `data_cadastro` DATE NOT NULL,
    PRIMARY KEY (`id`)
);
INSERT INTO `usuarios` (`nome`, `email`, `telefone`, `data_cadastro`) VALUES
('Ana Silva', 'ana.silva@email.com', '(11) 98765-4321', '2026-01-15'),
('Bruno Costa', 'bruno.costa@email.com', '(21) 97654-3210', '2026-02-20'),
('Carla Souza', 'carla.souza@email.com', '(31) 96543-2109', '2026-03-10'),
('Diego Oliveira', 'diego.oliveira@email.com', '(41) 95432-1098', '2026-04-05'),
('Elena Martins', 'elena.martins@email.com', '(51) 94321-0987', '2026-05-12');

CREATE TABLE `autores` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `nome` VARCHAR(255) NOT NULL,
    `nacionalidade` VARCHAR(255) NOT NULL,
    `ano_lancamento` INT NOT NULL,
    `avaliacao_livro` DECIMAL(3,2) NOT NULL,
    PRIMARY KEY (`id`)
);
INSERT INTO `autores` (`nome`, `nacionalidade`, `ano_lancamento`, `avaliacao_livro`) VALUES
('Machado de Assis', 'Brasileira', 1881, 4.90),
('George Orwell', 'Britânica', 1949, 4.85),
('J.K. Rowling', 'Britânica', 1997, 4.70),
('Agatha Christie', 'Britânica', 1920, 4.75),
('Clarice Lispector', 'Brasileira', 1943, 4.88);

CREATE TABLE `livros` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `titulo` VARCHAR(255) NOT NULL,
    `ano_publicacao` INT NOT NULL,
    `isbn` VARCHAR(255) NOT NULL UNIQUE,
    `autor_id` INT NOT NULL,
    PRIMARY KEY (`id`)
);
INSERT INTO `livros` (`titulo`, `ano_publicacao`, `isbn`, `autor_id`) VALUES
('Dom Casmurro', 1899, '9788535914849', 1),
('1984', 1949, '9788535914856', 2),
('Harry Potter e a Pedra Filosofal', 1997, '9788532511010', 3),
('E Não Sobrou Nenhum', 1939, '9788525057174', 4),
('A Hora da Estrela', 1977, '9788532520661', 5);

CREATE TABLE `emprestimos` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `usuario_id` INT NOT NULL,
    `data_emprestimo` DATE NOT NULL,
    `data_devolucao` DATE NOT NULL,
    `tempo_leitura_dias` INT NOT NULL, 
    PRIMARY KEY (`id`)
);
INSERT INTO `emprestimos` (`usuario_id`, `data_emprestimo`, `data_devolucao`, `tempo_leitura_dias`) VALUES
(1, '2026-05-01', '2026-05-15', 14),
(2, '2026-05-10', '2026-05-20', 10),
(3, '2026-05-12', '2026-05-19', 7),
(4, '2026-05-15', '2026-05-30', 15),
(5, '2026-05-18', '2026-05-25', 7);

CREATE TABLE `itens_emprestimo` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `emprestimo_id` INT NOT NULL,
    `livro_id` INT NOT NULL,
    `quantidade` INT NOT NULL,
    PRIMARY KEY (`id`)
);
INSERT INTO `itens_emprestimo` (`emprestimo_id`, `livro_id`, `quantidade`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1), 
(5, 5, 1); 

ALTER TABLE `livros` ADD CONSTRAINT `livros_fk4` FOREIGN KEY (`autor_id`) REFERENCES `autores`(`id`);
ALTER TABLE `emprestimos` ADD CONSTRAINT `emprestimos_fk1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios`(`id`);
ALTER TABLE `itens_emprestimo` ADD CONSTRAINT `itens_emprestimo_fk1` FOREIGN KEY (`emprestimo_id`) REFERENCES `emprestimos`(`id`);
ALTER TABLE `itens_emprestimo` ADD CONSTRAINT `itens_emprestimo_fk2` FOREIGN KEY (`livro_id`) REFERENCES `livros`(`id`);