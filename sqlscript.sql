REM   Script: Session 01
REM   atividade 02

CREATE TABLE FUNCIONARIO( 
    COD_FUNC numeric(4) constraint PK_COD_FUNC primary key, 
    FUNC_NOME varchar(100) NOT NULL, 
    FUNC_CPF varchar(11) constraint UK_CPF unique, 
    FUNC_SALARIO decimal(6,2) constraint CK_SALARIO check (SALARIO >= 1000.00), 
    FUNC_ENDERECO varchar(252), 
    FUNC_SEXO char (1), 
    CONSTRAINT CK_FUNC_SEXO CHECK (SEXO IN ('M', 'F')), 
    FUNC_COD_SUPER numeric(4) constraint FK_FUNCIONARIO_COD_SUPER references FUNCIONARIO(COD_FUNC), 
    FUNC_COD_DEPART numeric(4) constraint FK_FUNCIONARIO_COD_DEPART references DEPARTAMENTO(COD_DEPART) 
);

CREATE TABLE DEPARTAMENTO( 
    COD_DEPART numeric(4) constraint PK_FUNC_COD_DEPART primary key, 
    DEPART_NOME varchar(30) IS NOT NULL, 
    DEPART_DATA_INICIAL date 
);

CREATE TABLE LOCALIZACAO( 
    LOCAL_COD_DEPART numeric(4) constraint PK_FK_LOCALIZACAO_COD_DEPART references DEPARTAMENTO(COD_DEPART), 
    NM_LOCAL varchar(252), 
    constraint LOCALIZACAO primary key (COD_DEPART, LOCAL) 
);

CREATE TABLE PROJETO( 
    COD_PROJ numeric(4) constraint PK_COD_PROJ primary key , 
    COD_DEPART_PROJ numeric(4) constraint FK_COD_DEPART references DEPARTAMENTO(COD_DEPART), 
    TITULO_PROJ varchar(150) NOT NULL, 
    PROJ_DESCRICAO varchar(252), 
    PROJ_DATA_CAD date default sysdate 
);

CREATE TABLE PARTICIPA( 
    PART_COD_FUNC numeric(4) constraint PK_FK_COD_FUNC references FUNCIONARIO(COD_FUNC), 
    PART_COD_PROJ numeric(4) constraint PK_FK_COD_PROJ references PROJETO(COD_PROJ), 
    PART_HORAS varchar(50), 
    constraint PARTICIPA primary key (COD_FUNC, COD_PROJ) 
);

CREATE TABLE DEPENDENTE( 
    DEPEND_COD_FUNC numeric(4) constraint PK_FK_COD_FUNC references FUNCIONARIO(COD_FUNC), 
    DEPEND_SEQ numeric(4) constraint PK_SEQ primary key, 
    DEPEND_NOME varchar(100) NOT NULL, 
    DEPEND_PARENTESCO varchar(30) IS NOT NULL, 
    DEPEND_DATA_NASC date 
	DP_PARENTESCO VARCHAR(30) CONSTRAINT CK_DEPEND_PARENTESCO CHECK (DEPEND_PARENTESCO IN ('MÃE', 'PAI', 'IRMAOS', 'FILHO')) NOT NULL, 
);

