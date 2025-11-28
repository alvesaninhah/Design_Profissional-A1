--TABELAS-------------------------------------------------------------------------
CREATE SCHEMA Abastecimento;

CREATE TABLE Abastecimento.EstacaoTratamento (
    id_estacao INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6)
);

CREATE TABLE Abastecimento.Reservatorio (
    id_reservatorio INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nivel_atual DECIMAL(10,2),
    localizacao VARCHAR(200),
    capacidade_total DECIMAL(10,2),
    id_estacao INT NOT NULL,
    FOREIGN KEY (id_estacao) REFERENCES Abastecimento.EstacaoTratamento(id_estacao)
);

CREATE TABLE Abastecimento.RedeDistribuicao (
    id_trecho INT PRIMARY KEY,
    comprimento_m DECIMAL(10,2),
    pressao_media DECIMAL(10,2),
    id_reservatorio INT NOT NULL,
    FOREIGN KEY (id_reservatorio) REFERENCES Abastecimento.Reservatorio(id_reservatorio)
);

CREATE TABLE Abastecimento.Tipo_Sensor (
    id_tipo_sensor INT PRIMARY KEY,
    nome_tipo VARCHAR(50) NOT NULL,
    descricao TEXT
);

CREATE TABLE Abastecimento.Sensor (
    id_sensor INT PRIMARY KEY,
    status VARCHAR(30),
    data_instalacao DATE,
    id_tipo_sensor INT NOT NULL,
    FOREIGN KEY (id_tipo_sensor) REFERENCES Abastecimento.Tipo_Sensor(id_tipo_sensor)
);

CREATE TABLE Abastecimento.Tipo_Alerta (
    id_tipo_alerta INT PRIMARY KEY,
    nome_tipo VARCHAR(50) NOT NULL,
    descricao TEXT,
    nivel_padrao VARCHAR(20)
);

CREATE TABLE Abastecimento.Alerta (
    id_alerta INT PRIMARY KEY,
    descricao TEXT,
    nivel_prioridade VARCHAR(20),
    data_hora TIMESTAMP,
    id_sensor INT NOT NULL,
    id_tipo_alerta INT NOT NULL,
    FOREIGN KEY (id_sensor) REFERENCES Abastecimento.Sensor(id_sensor),
    FOREIGN KEY (id_tipo_alerta) REFERENCES Abastecimento.Tipo_Alerta(id_tipo_alerta)
);

CREATE TABLE Abastecimento.Hidrometro (
    id_hidrometro INT PRIMARY KEY,
    data_instalacao DATE,
    numero_serie VARCHAR(50) UNIQUE,
    id_trecho INT NOT NULL,
    id_sensor INT NOT NULL,
    FOREIGN KEY (id_trecho) REFERENCES Abastecimento.RedeDistribuicao(id_trecho),
    FOREIGN KEY (id_sensor) REFERENCES Abastecimento.Sensor(id_sensor)
);

CREATE TABLE Abastecimento.Cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    CPF_CNPJ VARCHAR(20) UNIQUE,
    tipo_cliente VARCHAR(20) CHECK (tipo_cliente IN ('Residencial', 'Comercial', 'Industrial')),
    id_hidrometro INT NOT NULL,
    FOREIGN KEY (id_hidrometro) REFERENCES Abastecimento.Hidrometro(id_hidrometro)
);

CREATE TABLE Abastecimento.Fatura (
    id_fatura INT PRIMARY KEY,
    data_emissao DATE,
    valor_total DECIMAL(10,2),
    status_pagamento VARCHAR(20) CHECK (status_pagamento IN ('PAGO','PENDENTE','ATRASADO')),
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Abastecimento.Cliente(id_cliente)
);

CREATE TABLE Abastecimento.LeituraHid (
    id_leitura INT PRIMARY KEY,
    data_leitura DATE,
    consumo_m3 DECIMAL(10,2),
    id_fatura INT NOT NULL,
    id_hidrometro INT NOT NULL,
    FOREIGN KEY (id_fatura) REFERENCES Abastecimento.Fatura(id_fatura),
    FOREIGN KEY (id_hidrometro) REFERENCES Abastecimento.Hidrometro(id_hidrometro)
);

--DADOS DE AMOSTRA-------------------------------------------------------------------

--EstacaoTratamento--
INSERT INTO Abastecimento.EstacaoTratamento (id_estacao, nome, latitude, longitude) VALUES
(1, 'Estação Central', -23.550520, -46.633308),
(2, 'Estação Norte', -23.540000, -46.620000);

--Reservatorio--
INSERT INTO Abastecimento.Reservatorio (id_reservatorio, nome, nivel_atual, localizacao, capacidade_total, id_estacao) VALUES
(1, 'Reservatório A', 75.50, 'Rua das Flores, 100', 1000.00, 1),
(2, 'Reservatório B', 50.00, 'Avenida Paulista, 2000', 1500.00, 1),
(3, 'Reservatório C', 90.00, 'Rua dos Pinheiros, 300', 1200.00, 2);

--RedeDistribuicao--
INSERT INTO Abastecimento.RedeDistribuicao (id_trecho, comprimento_m, pressao_media, id_reservatorio) VALUES
(1, 500.00, 3.5, 1),
(2, 750.00, 4.0, 2),
(3, 300.00, 2.8, 3);

--TipoSensor--
INSERT INTO Abastecimento.Tipo_Sensor (id_tipo_sensor, nome_tipo, descricao) VALUES
(1, 'Pressão', 'Sensor que mede a pressão da água'),
(2, 'Vazão', 'Sensor que mede o fluxo de água');

--Sensor--
INSERT INTO Abastecimento.Sensor (id_sensor, status, data_instalacao, id_tipo_sensor) VALUES
(1, 'Ativo', '2023-01-10', 1),
(2, 'Inativo', '2022-06-15', 2),
(3, 'Ativo', '2023-03-05', 1);

--TipoAlerta--
INSERT INTO Abastecimento.Tipo_Alerta (id_tipo_alerta, nome_tipo, descricao, nivel_padrao) VALUES
(1, 'Alerta Crítico', 'Indica falha grave no sistema', 'Alta'),
(2, 'Alerta Informativo', 'Indica manutenção preventiva', 'Baixa');

--Alerta--
INSERT INTO Abastecimento.Alerta (id_alerta, descricao, nivel_prioridade, data_hora, id_sensor, id_tipo_alerta) VALUES
(1, 'Pressão abaixo do normal', 'Alta', '2023-11-10 14:30:00', 1, 1),
(2, 'Manutenção preventiva necessária', 'Baixa', '2023-11-01 09:00:00', 2, 2);

--Hidrometro--
INSERT INTO Abastecimento.Hidrometro (id_hidrometro, data_instalacao, numero_serie, id_trecho, id_sensor) VALUES
(1, '2023-01-20', 'HID123456', 1, 1),
(2, '2023-02-15', 'HID789012', 2, 3);

--Cliente--
INSERT INTO Abastecimento.Cliente (id_cliente, nome, CPF_CNPJ, tipo_cliente, id_hidrometro) VALUES
(1, 'João Silva', '123.456.789-00', 'Residencial', 1),
(2, 'Empresa ABC', '12.345.678/0001-99', 'Comercial', 2);

--Fatura--
INSERT INTO Abastecimento.Fatura (id_fatura, data_emissao, valor_total, status_pagamento, id_cliente) VALUES
(1, '2023-10-01', 150.75, 'PAGO', 1),
(2, '2023-10-01', 1200.00, 'PENDENTE', 2);

--LeituraHid--
INSERT INTO Abastecimento.LeituraHid (id_leitura, data_leitura, consumo_m3, id_fatura, id_hidrometro) VALUES
(1, '2023-10-15', 25.50, 1, 1),
(2, '2023-10-15', 350.75, 2, 2);
