-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- Utente Registrato [User]
create table `utente_registrato` (
   `oid`  integer  not null,
   `e_mail`  varchar(255),
   `password`  varchar(255),
   `nome`  varchar(255),
   `cognome`  varchar(255),
   `data_nascita`  date,
   `data_registrazione`  date,
   `numero_telefono`  varchar(255),
   `username`  varchar(255),
  primary key (`oid`)
);


-- Indirizzo [ent1]
create table `indirizzo` (
   `oid`  integer  not null,
   `provincia`  varchar(255),
   `stato`  varchar(255),
   `primario`  bit,
   `via`  varchar(255),
   `numero_civico`  varchar(255),
   `cap`  varchar(255),
   `indirizzo`  varchar(255),
   `citta`  varchar(255),
  primary key (`oid`)
);


-- Negozio [ent10]
create table `negozio` (
   `oid`  integer  not null,
   `nome`  varchar(255),
   `data_apertura`  date,
   `dimensione`  integer,
   `numero_telefono`  varchar(255),
   `fax`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- Catalogo [ent11]
create table `catalogo` (
   `oid`  integer  not null,
   `nome`  varchar(255),
   `anno_di_validita`  integer,
  primary key (`oid`)
);


-- Prodotto [ent12]
create table `prodotto` (
   `oid`  integer  not null,
   `nome_modello`  varchar(255),
   `data_produzione`  date,
   `luogo_produzione`  varchar(255),
   `prezzo`  double precision,
   `usato`  bit,
   `percentuale_sconto`  integer,
  primary key (`oid`)
);


-- Catalogo Base [ent13]
create table `catalogo_base` (
   `catalogo_oid`  integer  not null,
  primary key (`catalogo_oid`)
);


-- Catalogo Specifico [ent14]
create table `catalogo_specifico` (
   `catalogo_oid`  integer  not null,
  primary key (`catalogo_oid`)
);


-- Acquisto [ent15]
create table `acquisto` (
   `oid`  integer  not null,
   `data_evasione`  time,
   `data_acquisto`  time,
  primary key (`oid`)
);


-- Prenotazione [ent16]
create table `prenotazione` (
   `oid`  integer  not null,
   `data_inizio`  time,
   `data_fine`  time,
  primary key (`oid`)
);


-- Evento [ent17]
create table `evento` (
   `oid`  integer  not null,
   `data_inizio_evento`  date,
   `nome_evento`  varchar(255),
   `data_fine_evento`  date,
   `prezzo`  double precision,
   `posti_disponibili`  integer,
  primary key (`oid`)
);


-- Recensione [ent18]
create table `recensione` (
   `oid`  integer  not null,
   `numero_stelle`  integer,
   `recensione`  longtext,
   `data`  time,
   `tipo`  varchar(255),
  primary key (`oid`)
);


-- Sala prove [ent19]
create table `sala_prove` (
   `oid`  integer  not null,
   `prezzo_orario`  double precision,
   `dimensione_stanza`  integer,
  primary key (`oid`)
);


-- Carta di Credito [ent2]
create table `carta_di_credito` (
   `oid`  integer  not null,
   `numero`  integer,
   `data_scadenza`  date,
   `intestatario`  varchar(255),
  primary key (`oid`)
);


-- Produttore [ent20]
create table `produttore` (
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`oid`)
);


-- Prenotazione Noleggio Prodotto [ent21]
create table `prenotazione_noleggio_prodotto` (
   `prenotazione_oid`  integer  not null,
   `cauzione`  varchar(255),
  primary key (`prenotazione_oid`)
);


-- Periodo [ent22]
create table `periodo` (
   `oid`  integer  not null,
   `mese`  varchar(255),
  primary key (`oid`)
);


-- Tipo Evento [ent26]
create table `tipo_evento` (
   `oid`  integer  not null,
  primary key (`oid`)
);


-- Zona [ent3]
create table `zona` (
   `oid`  integer  not null,
   `provincia`  varchar(255),
  primary key (`oid`)
);


-- Tipo prodotto [ent4]
create table `tipo_prodotto` (
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`oid`)
);


-- Gestore Catena [ent5]
create table `gestore_catena` (
   `utente_registrato_oid`  integer  not null,
  primary key (`utente_registrato_oid`)
);


-- Gestore Singolo Negozio [ent6]
create table `gestore_singolo_negozio` (
   `utente_registrato_oid`  integer  not null,
  primary key (`utente_registrato_oid`)
);


-- Categoria Prodotto [ent7]
create table `categoria_prodotto` (
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`oid`)
);


-- Cliente [ent8]
create table `cliente` (
   `utente_registrato_oid`  integer  not null,
  primary key (`utente_registrato_oid`)
);


-- Catena Negozi [ent9]
create table `catena_negozi` (
   `oid`  integer  not null,
   `nome`  varchar(255),
   `numero_telefono`  varchar(255),
   `fax`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);
create index `idx_group_module` on `group`(`module_oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);
create index `idx_group_module_group` on `group_module`(`group_oid`);
create index `idx_group_module_module` on `group_module`(`module_oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `utente_registrato`  add column  `group_oid`  integer;
alter table `utente_registrato`   add index fk_utente_registrato_group (`group_oid`), add constraint fk_utente_registrato_group foreign key (`group_oid`) references `group` (`oid`);
create index `idx_utente_registrato_group` on `utente_registrato`(`group_oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `utente_registrato_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`utente_registrato_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_utente_registrat (`utente_registrato_oid`), add constraint fk_user_group_utente_registrat foreign key (`utente_registrato_oid`) references `utente_registrato` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);
create index `idx_user_group_utente_registra` on `user_group`(`utente_registrato_oid`);
create index `idx_user_group_group` on `user_group`(`group_oid`);


-- Catena Negozi_Gestore Catena [rel1]
alter table `gestore_catena`  add column  `catena_negozi_oid`  integer;
alter table `gestore_catena`   add index fk_gestore_catena_catena_negoz (`catena_negozi_oid`), add constraint fk_gestore_catena_catena_negoz foreign key (`catena_negozi_oid`) references `catena_negozi` (`oid`);
create index `idx_gestore_catena_catena_nego` on `gestore_catena`(`catena_negozi_oid`);


-- Evento_Negozio [rel10]
alter table `evento`  add column  `negozio_oid`  integer;
alter table `evento`   add index fk_evento_negozio (`negozio_oid`), add constraint fk_evento_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);
create index `idx_evento_negozio` on `evento`(`negozio_oid`);


-- Prenotazione_Negozio [rel11]
alter table `prenotazione`  add column  `negozio_oid`  integer;
alter table `prenotazione`   add index fk_prenotazione_negozio (`negozio_oid`), add constraint fk_prenotazione_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);
create index `idx_prenotazione_negozio` on `prenotazione`(`negozio_oid`);


-- Prenotazione_Prodotto [rel12]
create table `prenotazione_prodotto` (
   `prenotazione_noleggio_prodotto`  integer not null,
   `prodotto_oid`  integer not null,
  primary key (`prenotazione_noleggio_prodotto`, `prodotto_oid`)
);
alter table `prenotazione_prodotto`   add index fk_prenotazione_prodotto_preno (`prenotazione_noleggio_prodotto`), add constraint fk_prenotazione_prodotto_preno foreign key (`prenotazione_noleggio_prodotto`) references `prenotazione_noleggio_prodotto` (`prenotazione_oid`);
alter table `prenotazione_prodotto`   add index fk_prenotazione_prodotto_prodo (`prodotto_oid`), add constraint fk_prenotazione_prodotto_prodo foreign key (`prodotto_oid`) references `prodotto` (`oid`);
create index `idx_prenotazione_prodotto_pren` on `prenotazione_prodotto`(`prenotazione_noleggio_prodotto`);
create index `idx_prenotazione_prodotto_prod` on `prenotazione_prodotto`(`prodotto_oid`);


-- Prenotazione_Gestore Singolo Negozio [rel13]
alter table `prenotazione`  add column  `gestore_singolo_negozio_oid`  integer;
alter table `prenotazione`   add index fk_prenotazione_gestore_singol (`gestore_singolo_negozio_oid`), add constraint fk_prenotazione_gestore_singol foreign key (`gestore_singolo_negozio_oid`) references `gestore_singolo_negozio` (`utente_registrato_oid`);
create index `idx_prenotazione_gestore_singo` on `prenotazione`(`gestore_singolo_negozio_oid`);


-- Cliente Registrato_Prenotazione [rel14]
alter table `prenotazione`  add column  `cliente_oid`  integer;
alter table `prenotazione`   add index fk_prenotazione_cliente (`cliente_oid`), add constraint fk_prenotazione_cliente foreign key (`cliente_oid`) references `cliente` (`utente_registrato_oid`);
create index `idx_prenotazione_cliente` on `prenotazione`(`cliente_oid`);


-- Acquisto_Prodotto [rel15]
create table `acquisto_prodotto` (
   `acquisto_oid`  integer not null,
   `prodotto_oid`  integer not null,
  primary key (`acquisto_oid`, `prodotto_oid`)
);
alter table `acquisto_prodotto`   add index fk_acquisto_prodotto_acquisto (`acquisto_oid`), add constraint fk_acquisto_prodotto_acquisto foreign key (`acquisto_oid`) references `acquisto` (`oid`);
alter table `acquisto_prodotto`   add index fk_acquisto_prodotto_prodotto (`prodotto_oid`), add constraint fk_acquisto_prodotto_prodotto foreign key (`prodotto_oid`) references `prodotto` (`oid`);
create index `idx_acquisto_prodotto_acquisto` on `acquisto_prodotto`(`acquisto_oid`);
create index `idx_acquisto_prodotto_prodotto` on `acquisto_prodotto`(`prodotto_oid`);


-- Acquisto_Negozio [rel16]
alter table `acquisto`  add column  `negozio_oid`  integer;
alter table `acquisto`   add index fk_acquisto_negozio (`negozio_oid`), add constraint fk_acquisto_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);
create index `idx_acquisto_negozio` on `acquisto`(`negozio_oid`);


-- Cliente Registrato_Acquisto [rel17]
alter table `acquisto`  add column  `cliente_oid`  integer;
alter table `acquisto`   add index fk_acquisto_cliente (`cliente_oid`), add constraint fk_acquisto_cliente foreign key (`cliente_oid`) references `cliente` (`utente_registrato_oid`);
create index `idx_acquisto_cliente` on `acquisto`(`cliente_oid`);


-- Valutazione_Negozio [rel18]
alter table `recensione`  add column  `negozio_oid`  integer;
alter table `recensione`   add index fk_recensione_negozio (`negozio_oid`), add constraint fk_recensione_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);
create index `idx_recensione_negozio` on `recensione`(`negozio_oid`);


-- Valutazione_Cliente Registrato [rel19]
alter table `recensione`  add column  `cliente_oid`  integer;
alter table `recensione`   add index fk_recensione_cliente (`cliente_oid`), add constraint fk_recensione_cliente foreign key (`cliente_oid`) references `cliente` (`utente_registrato_oid`);
create index `idx_recensione_cliente` on `recensione`(`cliente_oid`);


-- Gestore Catena_Base [rel2]
alter table `catalogo_base`  add column  `gestore_catena_oid`  integer;
alter table `catalogo_base`   add index fk_catalogo_base_gestore_caten (`gestore_catena_oid`), add constraint fk_catalogo_base_gestore_caten foreign key (`gestore_catena_oid`) references `gestore_catena` (`utente_registrato_oid`);
create index `idx_catalogo_base_gestore_cate` on `catalogo_base`(`gestore_catena_oid`);


-- Indirizzo_User [rel20]
alter table `utente_registrato`  add column  `indirizzo_oid`  integer;
alter table `utente_registrato`   add index fk_utente_registrato_indirizzo (`indirizzo_oid`), add constraint fk_utente_registrato_indirizzo foreign key (`indirizzo_oid`) references `indirizzo` (`oid`);
create index `idx_utente_registrato_indirizz` on `utente_registrato`(`indirizzo_oid`);


-- Valutazione_Prodotto [rel21]
alter table `recensione`  add column  `prodotto_oid`  integer;
alter table `recensione`   add index fk_recensione_prodotto (`prodotto_oid`), add constraint fk_recensione_prodotto foreign key (`prodotto_oid`) references `prodotto` (`oid`);
create index `idx_recensione_prodotto` on `recensione`(`prodotto_oid`);


-- Catena Negozi_Negozio [rel22]
alter table `negozio`  add column  `catena_negozi_oid`  integer;
alter table `negozio`   add index fk_negozio_catena_negozi (`catena_negozi_oid`), add constraint fk_negozio_catena_negozi foreign key (`catena_negozi_oid`) references `catena_negozi` (`oid`);
create index `idx_negozio_catena_negozi` on `negozio`(`catena_negozi_oid`);


-- Negozio_Catalogo [rel23]
create table `negozio_catalogo` (
   `negozio_oid`  integer not null,
   `catalogo_oid`  integer not null,
  primary key (`negozio_oid`, `catalogo_oid`)
);
alter table `negozio_catalogo`   add index fk_negozio_catalogo_negozio (`negozio_oid`), add constraint fk_negozio_catalogo_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);
alter table `negozio_catalogo`   add index fk_negozio_catalogo_catalogo (`catalogo_oid`), add constraint fk_negozio_catalogo_catalogo foreign key (`catalogo_oid`) references `catalogo` (`oid`);
create index `idx_negozio_catalogo_negozio` on `negozio_catalogo`(`negozio_oid`);
create index `idx_negozio_catalogo_catalogo` on `negozio_catalogo`(`catalogo_oid`);


-- Catalogo_Prodotto [rel24]
create table `catalogo_prodotto` (
   `catalogo_oid`  integer not null,
   `prodotto_oid`  integer not null,
  primary key (`catalogo_oid`, `prodotto_oid`)
);
alter table `catalogo_prodotto`   add index fk_catalogo_prodotto_catalogo (`catalogo_oid`), add constraint fk_catalogo_prodotto_catalogo foreign key (`catalogo_oid`) references `catalogo` (`oid`);
alter table `catalogo_prodotto`   add index fk_catalogo_prodotto_prodotto (`prodotto_oid`), add constraint fk_catalogo_prodotto_prodotto foreign key (`prodotto_oid`) references `prodotto` (`oid`);
create index `idx_catalogo_prodotto_catalogo` on `catalogo_prodotto`(`catalogo_oid`);
create index `idx_catalogo_prodotto_prodotto` on `catalogo_prodotto`(`prodotto_oid`);


-- Prodotto_Categoria [rel25]
alter table `prodotto`  add column  `categoria_prodotto_oid`  integer;
alter table `prodotto`   add index fk_prodotto_categoria_prodotto (`categoria_prodotto_oid`), add constraint fk_prodotto_categoria_prodotto foreign key (`categoria_prodotto_oid`) references `categoria_prodotto` (`oid`);
create index `idx_prodotto_categoria_prodott` on `prodotto`(`categoria_prodotto_oid`);


-- Catena Negozi_Base [rel26]
alter table `catalogo_base`  add column  `catena_negozi_oid`  integer;
alter table `catalogo_base`   add index fk_catalogo_base_catena_negozi (`catena_negozi_oid`), add constraint fk_catalogo_base_catena_negozi foreign key (`catena_negozi_oid`) references `catena_negozi` (`oid`);
create index `idx_catalogo_base_catena_negoz` on `catalogo_base`(`catena_negozi_oid`);


-- Cliente Registrato_Carta di Credito [rel27]
alter table `carta_di_credito`  add column  `cliente_oid`  integer;
alter table `carta_di_credito`   add index fk_carta_di_credito_cliente (`cliente_oid`), add constraint fk_carta_di_credito_cliente foreign key (`cliente_oid`) references `cliente` (`utente_registrato_oid`);
create index `idx_carta_di_credito_cliente` on `carta_di_credito`(`cliente_oid`);


-- Produttore_Prodotto [rel29]
alter table `prodotto`  add column  `produttore_oid`  integer;
alter table `prodotto`   add index fk_prodotto_produttore (`produttore_oid`), add constraint fk_prodotto_produttore foreign key (`produttore_oid`) references `produttore` (`oid`);
create index `idx_prodotto_produttore` on `prodotto`(`produttore_oid`);


-- Gestore Singolo Negozio_Specifico [rel3]
alter table `catalogo_specifico`  add column  `gestore_singolo_negozio_oid`  integer;
alter table `catalogo_specifico`   add index fk_catalogo_specifico_gestore (`gestore_singolo_negozio_oid`), add constraint fk_catalogo_specifico_gestore foreign key (`gestore_singolo_negozio_oid`) references `gestore_singolo_negozio` (`utente_registrato_oid`);
create index `idx_catalogo_specifico_gestore` on `catalogo_specifico`(`gestore_singolo_negozio_oid`);


-- Negozio_Specifico [rel30]
alter table `catalogo_specifico`  add column  `negozio_oid`  integer;
alter table `catalogo_specifico`   add index fk_catalogo_specifico_negozio (`negozio_oid`), add constraint fk_catalogo_specifico_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);
create index `idx_catalogo_specifico_negozio` on `catalogo_specifico`(`negozio_oid`);


-- CategoriaProdottoCatalogoBase [rel31]
alter table `categoria_prodotto`  add column  `catalogo_base_oid`  integer;
alter table `categoria_prodotto`   add index fk_categoria_prodotto_catalogo (`catalogo_base_oid`), add constraint fk_categoria_prodotto_catalogo foreign key (`catalogo_base_oid`) references `catalogo_base` (`catalogo_oid`);
create index `idx_categoria_prodotto_catalog` on `categoria_prodotto`(`catalogo_base_oid`);


-- Negozio_Indirizzo [rel32]
alter table `negozio`  add column  `indirizzo_oid`  integer;
alter table `negozio`   add index fk_negozio_indirizzo (`indirizzo_oid`), add constraint fk_negozio_indirizzo foreign key (`indirizzo_oid`) references `indirizzo` (`oid`);
create index `idx_negozio_indirizzo` on `negozio`(`indirizzo_oid`);


-- Negozio_Zona [rel33]
alter table `negozio`  add column  `zona_oid`  integer;
alter table `negozio`   add index fk_negozio_zona (`zona_oid`), add constraint fk_negozio_zona foreign key (`zona_oid`) references `zona` (`oid`);
create index `idx_negozio_zona` on `negozio`(`zona_oid`);


-- Acquisto_Prenotazione [rel34]
alter table `prenotazione`  add column  `acquisto_oid`  integer;
alter table `prenotazione`   add index fk_prenotazione_acquisto (`acquisto_oid`), add constraint fk_prenotazione_acquisto foreign key (`acquisto_oid`) references `acquisto` (`oid`);
create index `idx_prenotazione_acquisto` on `prenotazione`(`acquisto_oid`);


-- Gestore Catena_Utente Registrato [rel35]
create table `gestore_catena_utente_registra` (
   `gestore_catena_oid`  integer not null,
   `utente_registrato_oid`  integer not null,
  primary key (`gestore_catena_oid`, `utente_registrato_oid`)
);
alter table `gestore_catena_utente_registra`   add index fk_gestore_catena_utente_regis (`gestore_catena_oid`), add constraint fk_gestore_catena_utente_regis foreign key (`gestore_catena_oid`) references `gestore_catena` (`utente_registrato_oid`);
alter table `gestore_catena_utente_registra`   add index fk_gestore_catena_utente_reg_2 (`utente_registrato_oid`), add constraint fk_gestore_catena_utente_reg_2 foreign key (`utente_registrato_oid`) references `utente_registrato` (`oid`);
create index `idx_gestore_catena_utente_regi` on `gestore_catena_utente_registra`(`gestore_catena_oid`);
create index `idx_gestore_catena_utente_re_2` on `gestore_catena_utente_registra`(`utente_registrato_oid`);


-- Catena Negozi_Indirizzo [rel36]
alter table `indirizzo`  add column  `catena_negozi_oid`  integer;
alter table `indirizzo`   add index fk_indirizzo_catena_negozi (`catena_negozi_oid`), add constraint fk_indirizzo_catena_negozi foreign key (`catena_negozi_oid`) references `catena_negozi` (`oid`);
create index `idx_indirizzo_catena_negozi` on `indirizzo`(`catena_negozi_oid`);


-- CatalogoSpecificoCategoriaProdotto [rel37]
alter table `catalogo_specifico`  add column  `categoria_prodotto_oid`  integer;
alter table `catalogo_specifico`   add index fk_catalogo_specifico_categori (`categoria_prodotto_oid`), add constraint fk_catalogo_specifico_categori foreign key (`categoria_prodotto_oid`) references `categoria_prodotto` (`oid`);
create index `idx_catalogo_specifico_categor` on `catalogo_specifico`(`categoria_prodotto_oid`);


-- Categoria Prodotto_Tipo prodotto [rel38]
alter table `tipo_prodotto`  add column  `categoria_prodotto_oid`  integer;
alter table `tipo_prodotto`   add index fk_tipo_prodotto_categoria_pro (`categoria_prodotto_oid`), add constraint fk_tipo_prodotto_categoria_pro foreign key (`categoria_prodotto_oid`) references `categoria_prodotto` (`oid`);
create index `idx_tipo_prodotto_categoria_pr` on `tipo_prodotto`(`categoria_prodotto_oid`);


-- Tipo prodotto_Prodotto [rel39]
alter table `prodotto`  add column  `tipo_prodotto_oid`  integer;
alter table `prodotto`   add index fk_prodotto_tipo_prodotto (`tipo_prodotto_oid`), add constraint fk_prodotto_tipo_prodotto foreign key (`tipo_prodotto_oid`) references `tipo_prodotto` (`oid`);
create index `idx_prodotto_tipo_prodotto` on `prodotto`(`tipo_prodotto_oid`);


-- Gestore Singolo Negozio_Negozio [rel4]
alter table `negozio`  add column  `gestore_singolo_negozio_oid`  integer;
alter table `negozio`   add index fk_negozio_gestore_singolo_neg (`gestore_singolo_negozio_oid`), add constraint fk_negozio_gestore_singolo_neg foreign key (`gestore_singolo_negozio_oid`) references `gestore_singolo_negozio` (`utente_registrato_oid`);
create index `idx_negozio_gestore_singolo_ne` on `negozio`(`gestore_singolo_negozio_oid`);


-- Evento_Periodo [rel41]
alter table `evento`  add column  `periodo_oid`  integer;
alter table `evento`   add index fk_evento_periodo (`periodo_oid`), add constraint fk_evento_periodo foreign key (`periodo_oid`) references `periodo` (`oid`);
create index `idx_evento_periodo` on `evento`(`periodo_oid`);


-- Evento_Tipo Evento [rel42]
create table `evento_tipo_evento` (
   `evento_oid`  integer not null,
   `tipo_evento_oid`  integer not null,
  primary key (`evento_oid`, `tipo_evento_oid`)
);
alter table `evento_tipo_evento`   add index fk_evento_tipo_evento_evento (`evento_oid`), add constraint fk_evento_tipo_evento_evento foreign key (`evento_oid`) references `evento` (`oid`);
alter table `evento_tipo_evento`   add index fk_evento_tipo_evento_tipo_eve (`tipo_evento_oid`), add constraint fk_evento_tipo_evento_tipo_eve foreign key (`tipo_evento_oid`) references `tipo_evento` (`oid`);
create index `idx_evento_tipo_evento_evento` on `evento_tipo_evento`(`evento_oid`);
create index `idx_evento_tipo_evento_tipo_ev` on `evento_tipo_evento`(`tipo_evento_oid`);


-- Catalogo_Categoria Prodotto [rel44]
create table `catalogo_categoria_prodotto` (
   `catalogo_oid`  integer not null,
   `categoria_prodotto_oid`  integer not null,
  primary key (`catalogo_oid`, `categoria_prodotto_oid`)
);
alter table `catalogo_categoria_prodotto`   add index fk_catalogo_categoria_prodotto (`catalogo_oid`), add constraint fk_catalogo_categoria_prodotto foreign key (`catalogo_oid`) references `catalogo` (`oid`);
alter table `catalogo_categoria_prodotto`   add index fk_catalogo_categoria_prodot_2 (`categoria_prodotto_oid`), add constraint fk_catalogo_categoria_prodot_2 foreign key (`categoria_prodotto_oid`) references `categoria_prodotto` (`oid`);
create index `idx_catalogo_categoria_prodott` on `catalogo_categoria_prodotto`(`catalogo_oid`);
create index `idx_catalogo_categoria_prodo_2` on `catalogo_categoria_prodotto`(`categoria_prodotto_oid`);


-- Gestore Singolo Negozio_Evento [rel5]
alter table `evento`  add column  `gestore_singolo_negozio_oid`  integer;
alter table `evento`   add index fk_evento_gestore_singolo_nego (`gestore_singolo_negozio_oid`), add constraint fk_evento_gestore_singolo_nego foreign key (`gestore_singolo_negozio_oid`) references `gestore_singolo_negozio` (`utente_registrato_oid`);
create index `idx_evento_gestore_singolo_neg` on `evento`(`gestore_singolo_negozio_oid`);


-- Evento_Prenotazione [rel6]
alter table `prenotazione`  add column  `evento_oid`  integer;
alter table `prenotazione`   add index fk_prenotazione_evento (`evento_oid`), add constraint fk_prenotazione_evento foreign key (`evento_oid`) references `evento` (`oid`);
create index `idx_prenotazione_evento` on `prenotazione`(`evento_oid`);


-- Sala prove_Negozio [rel7]
alter table `negozio`  add column  `sala_prove_oid`  integer;
alter table `negozio`   add index fk_negozio_sala_prove (`sala_prove_oid`), add constraint fk_negozio_sala_prove foreign key (`sala_prove_oid`) references `sala_prove` (`oid`);
create index `idx_negozio_sala_prove` on `negozio`(`sala_prove_oid`);


-- Negozio_Base [rel8]
alter table `negozio`  add column  `catalogo_base_oid`  integer;
alter table `negozio`   add index fk_negozio_catalogo_base (`catalogo_base_oid`), add constraint fk_negozio_catalogo_base foreign key (`catalogo_base_oid`) references `catalogo_base` (`catalogo_oid`);
create index `idx_negozio_catalogo_base` on `negozio`(`catalogo_base_oid`);


-- Sala prove_Prenotazione [rel9]
alter table `prenotazione`  add column  `sala_prove_oid`  integer;
alter table `prenotazione`   add index fk_prenotazione_sala_prove (`sala_prove_oid`), add constraint fk_prenotazione_sala_prove foreign key (`sala_prove_oid`) references `sala_prove` (`oid`);
create index `idx_prenotazione_sala_prove` on `prenotazione`(`sala_prove_oid`);


-- GEN FK: Catalogo Base --> Catalogo
alter table `catalogo_base`   add index fk_catalogo_base_catalogo (`catalogo_oid`), add constraint fk_catalogo_base_catalogo foreign key (`catalogo_oid`) references `catalogo` (`oid`);


-- GEN FK: Catalogo Specifico --> Catalogo
alter table `catalogo_specifico`   add index fk_catalogo_specifico_catalogo (`catalogo_oid`), add constraint fk_catalogo_specifico_catalogo foreign key (`catalogo_oid`) references `catalogo` (`oid`);


-- GEN FK: Prenotazione Noleggio Prodotto --> Prenotazione
alter table `prenotazione_noleggio_prodotto`   add index fk_prenotazione_noleggio_prodo (`prenotazione_oid`), add constraint fk_prenotazione_noleggio_prodo foreign key (`prenotazione_oid`) references `prenotazione` (`oid`);


-- GEN FK: Gestore Catena --> Utente Registrato
alter table `gestore_catena`   add index fk_gestore_catena_utente_reg_3 (`utente_registrato_oid`), add constraint fk_gestore_catena_utente_reg_3 foreign key (`utente_registrato_oid`) references `utente_registrato` (`oid`);


-- GEN FK: Gestore Singolo Negozio --> Utente Registrato
alter table `gestore_singolo_negozio`   add index fk_gestore_singolo_negozio_ute (`utente_registrato_oid`), add constraint fk_gestore_singolo_negozio_ute foreign key (`utente_registrato_oid`) references `utente_registrato` (`oid`);


-- GEN FK: Cliente --> Utente Registrato
alter table `cliente`   add index fk_cliente_utente_registrato (`utente_registrato_oid`), add constraint fk_cliente_utente_registrato foreign key (`utente_registrato_oid`) references `utente_registrato` (`oid`);


-- Utente Registrato.Indirizzo Primario [User#att71]
create view `utente_registrato_indirizzo_pr` as
select AL1.`oid` as `oid`, AL2.`indirizzo` as `der_attr`
from  `utente_registrato` AL1 
               left outer join `indirizzo` AL2 on AL1.`indirizzo_oid`=AL2.`oid`
where AL2.`primario` = '1';


-- Prodotto_Recensione [rel28]
create view `prodottotorecensione_view` as
select AL1.`oid` as `s_oid`, AL2.`oid` as `t_oid`
from  `prodotto` AL1 ,
         `recensione` AL2 
where AL2.`numero_stelle` >= 4;


-- Migliori Prodotti [ent25]
create view `migliori_prodotti_view` as
select distinct AL1.`oid` as `oid`
from  `prodotto` AL1 
               left outer join `prodotto` AL2 on AL1.`oid`=AL2.`s_oid`
               left outer join `recensione` AL3 on AL2.`t_oid`=AL3.`oid`
where AL3.`numero_stelle` >= 4;


-- Negozio_Recensione [rel40]
create view `negoziotorecensione_view` as
select AL1.`oid` as `s_oid`, AL2.`oid` as `t_oid`
from  `negozio` AL1 ,
         `recensione` AL2 
where AL2.`numero_stelle` >= 4;


-- Migliori Negozi [ent23]
create view `migliori_negozi_view` as
select distinct AL1.`oid` as `oid`
from  `negozio` AL1 
               left outer join `negozio` AL2 on AL1.`oid`=AL2.`s_oid`
               left outer join `recensione` AL3 on AL2.`t_oid`=AL3.`oid`
where AL3.`numero_stelle` >= 4;


