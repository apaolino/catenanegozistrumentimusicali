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
   `username`  varchar(255),
   `password`  varchar(255),
   `e_mail`  varchar(255),
   `nome`  varchar(255),
   `cognome`  varchar(255),
   `data_nascita`  varchar(255),
   `data_registrazione`  date,
   `numero_telefono`  varchar(255),
  primary key (`oid`)
);


-- Indirizzo [ent1]
create table `indirizzo` (
   `oid`  integer  not null,
   `via`  varchar(255),
   `numero_civico`  varchar(255),
   `cap`  varchar(255),
   `citta`  varchar(255),
   `provincia`  varchar(255),
   `stato`  varchar(255),
   `primario`  bit,
   `indirizzo`  varchar(255),
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


-- Base [ent13]
create table `base` (
   `catalogo_oid`  integer  not null,
  primary key (`catalogo_oid`)
);


-- Specifico [ent14]
create table `specifico` (
   `catalogo_oid`  integer  not null,
  primary key (`catalogo_oid`)
);


-- Acquisto [ent15]
create table `acquisto` (
   `oid`  integer  not null,
   `data_acquisto`  time,
   `data_evasione`  time,
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


-- Periodo [ent24]
create table `periodo` (
   `mese_di_riferimento`  varchar(255)
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


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `utente_registrato`  add column  `group_oid`  integer;
alter table `utente_registrato`   add index fk_utente_registrato_group (`group_oid`), add constraint fk_utente_registrato_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `utente_registrato_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`utente_registrato_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_utente_registrat (`utente_registrato_oid`), add constraint fk_user_group_utente_registrat foreign key (`utente_registrato_oid`) references `utente_registrato` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- Catena Negozi_Gestore Catena [rel1]
alter table `gestore_catena`  add column  `catena_negozi_oid`  integer;
alter table `gestore_catena`   add index fk_gestore_catena_catena_negoz (`catena_negozi_oid`), add constraint fk_gestore_catena_catena_negoz foreign key (`catena_negozi_oid`) references `catena_negozi` (`oid`);


-- Evento_Negozio [rel10]
alter table `evento`  add column  `negozio_oid`  integer;
alter table `evento`   add index fk_evento_negozio (`negozio_oid`), add constraint fk_evento_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);


-- Prenotazione_Negozio [rel11]
alter table `prenotazione`  add column  `negozio_oid`  integer;
alter table `prenotazione`   add index fk_prenotazione_negozio (`negozio_oid`), add constraint fk_prenotazione_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);


-- Prenotazione_Prodotto [rel12]
create table `prenotazione_prodotto` (
   `prenotazione_noleggio_prodotto`  integer not null,
   `prodotto_oid`  integer not null,
  primary key (`prenotazione_noleggio_prodotto`, `prodotto_oid`)
);
alter table `prenotazione_prodotto`   add index fk_prenotazione_prodotto_preno (`prenotazione_noleggio_prodotto`), add constraint fk_prenotazione_prodotto_preno foreign key (`prenotazione_noleggio_prodotto`) references `prenotazione_noleggio_prodotto` (`prenotazione_oid`);
alter table `prenotazione_prodotto`   add index fk_prenotazione_prodotto_prodo (`prodotto_oid`), add constraint fk_prenotazione_prodotto_prodo foreign key (`prodotto_oid`) references `prodotto` (`oid`);


-- Prenotazione_Gestore Singolo Negozio [rel13]
alter table `gestore_singolo_negozio`  add column  `prenotazione_oid`  integer;
alter table `gestore_singolo_negozio`   add index fk_gestore_singolo_negozio_pre (`prenotazione_oid`), add constraint fk_gestore_singolo_negozio_pre foreign key (`prenotazione_oid`) references `prenotazione` (`oid`);


-- Cliente Registrato_Prenotazione [rel14]
alter table `cliente`  add column  `prenotazione_oid`  integer;
alter table `cliente`   add index fk_cliente_prenotazione (`prenotazione_oid`), add constraint fk_cliente_prenotazione foreign key (`prenotazione_oid`) references `prenotazione` (`oid`);


-- Acquisto_Prodotto [rel15]
create table `acquisto_prodotto` (
   `acquisto_oid`  integer not null,
   `prodotto_oid`  integer not null,
  primary key (`acquisto_oid`, `prodotto_oid`)
);
alter table `acquisto_prodotto`   add index fk_acquisto_prodotto_acquisto (`acquisto_oid`), add constraint fk_acquisto_prodotto_acquisto foreign key (`acquisto_oid`) references `acquisto` (`oid`);
alter table `acquisto_prodotto`   add index fk_acquisto_prodotto_prodotto (`prodotto_oid`), add constraint fk_acquisto_prodotto_prodotto foreign key (`prodotto_oid`) references `prodotto` (`oid`);


-- Acquisto_Negozio [rel16]
alter table `acquisto`  add column  `negozio_oid`  integer;
alter table `acquisto`   add index fk_acquisto_negozio (`negozio_oid`), add constraint fk_acquisto_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);


-- Cliente Registrato_Acquisto [rel17]
alter table `acquisto`  add column  `cliente_oid`  integer;
alter table `acquisto`   add index fk_acquisto_cliente (`cliente_oid`), add constraint fk_acquisto_cliente foreign key (`cliente_oid`) references `cliente` (`utente_registrato_oid`);


-- Valutazione_Negozio [rel18]
alter table `recensione`  add column  `negozio_oid`  integer;
alter table `recensione`   add index fk_recensione_negozio (`negozio_oid`), add constraint fk_recensione_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);


-- Valutazione_Cliente Registrato [rel19]
alter table `recensione`  add column  `cliente_oid`  integer;
alter table `recensione`   add index fk_recensione_cliente (`cliente_oid`), add constraint fk_recensione_cliente foreign key (`cliente_oid`) references `cliente` (`utente_registrato_oid`);


-- Gestore Catena_Base [rel2]
alter table `base`  add column  `gestore_catena_oid`  integer;
alter table `base`   add index fk_base_gestore_catena (`gestore_catena_oid`), add constraint fk_base_gestore_catena foreign key (`gestore_catena_oid`) references `gestore_catena` (`utente_registrato_oid`);


-- Indirizzo_User [rel20]
alter table `utente_registrato`  add column  `indirizzo_oid`  integer;
alter table `utente_registrato`   add index fk_utente_registrato_indirizzo (`indirizzo_oid`), add constraint fk_utente_registrato_indirizzo foreign key (`indirizzo_oid`) references `indirizzo` (`oid`);


-- Valutazione_Prodotto [rel21]
alter table `recensione`  add column  `prodotto_oid`  integer;
alter table `recensione`   add index fk_recensione_prodotto (`prodotto_oid`), add constraint fk_recensione_prodotto foreign key (`prodotto_oid`) references `prodotto` (`oid`);


-- Catena Negozi_Negozio [rel22]
alter table `negozio`  add column  `catena_negozi_oid`  integer;
alter table `negozio`   add index fk_negozio_catena_negozi (`catena_negozi_oid`), add constraint fk_negozio_catena_negozi foreign key (`catena_negozi_oid`) references `catena_negozi` (`oid`);


-- Negozio_Catalogo [rel23]
create table `negozio_catalogo` (
   `negozio_oid`  integer not null,
   `catalogo_oid`  integer not null,
  primary key (`negozio_oid`, `catalogo_oid`)
);
alter table `negozio_catalogo`   add index fk_negozio_catalogo_negozio (`negozio_oid`), add constraint fk_negozio_catalogo_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);
alter table `negozio_catalogo`   add index fk_negozio_catalogo_catalogo (`catalogo_oid`), add constraint fk_negozio_catalogo_catalogo foreign key (`catalogo_oid`) references `catalogo` (`oid`);


-- Catalogo_Prodotto [rel24]
create table `catalogo_prodotto` (
   `catalogo_oid`  integer not null,
   `prodotto_oid`  integer not null,
  primary key (`catalogo_oid`, `prodotto_oid`)
);
alter table `catalogo_prodotto`   add index fk_catalogo_prodotto_catalogo (`catalogo_oid`), add constraint fk_catalogo_prodotto_catalogo foreign key (`catalogo_oid`) references `catalogo` (`oid`);
alter table `catalogo_prodotto`   add index fk_catalogo_prodotto_prodotto (`prodotto_oid`), add constraint fk_catalogo_prodotto_prodotto foreign key (`prodotto_oid`) references `prodotto` (`oid`);


-- Prodotto_Categoria [rel25]
alter table `prodotto`  add column  `categoria_prodotto_oid`  integer;
alter table `prodotto`   add index fk_prodotto_categoria_prodotto (`categoria_prodotto_oid`), add constraint fk_prodotto_categoria_prodotto foreign key (`categoria_prodotto_oid`) references `categoria_prodotto` (`oid`);


-- Catena Negozi_Base [rel26]
alter table `base`  add column  `catena_negozi_oid`  integer;
alter table `base`   add index fk_base_catena_negozi (`catena_negozi_oid`), add constraint fk_base_catena_negozi foreign key (`catena_negozi_oid`) references `catena_negozi` (`oid`);


-- Cliente Registrato_Carta di Credito [rel27]
alter table `carta_di_credito`  add column  `cliente_oid`  integer;
alter table `carta_di_credito`   add index fk_carta_di_credito_cliente (`cliente_oid`), add constraint fk_carta_di_credito_cliente foreign key (`cliente_oid`) references `cliente` (`utente_registrato_oid`);


-- Produttore_Prodotto [rel29]
alter table `prodotto`  add column  `produttore_oid`  integer;
alter table `prodotto`   add index fk_prodotto_produttore (`produttore_oid`), add constraint fk_prodotto_produttore foreign key (`produttore_oid`) references `produttore` (`oid`);


-- Gestore Singolo Negozio_Specifico [rel3]
alter table `specifico`  add column  `gestore_singolo_negozio_oid`  integer;
alter table `specifico`   add index fk_specifico_gestore_singolo_n (`gestore_singolo_negozio_oid`), add constraint fk_specifico_gestore_singolo_n foreign key (`gestore_singolo_negozio_oid`) references `gestore_singolo_negozio` (`utente_registrato_oid`);


-- Negozio_Specifico [rel30]
alter table `specifico`  add column  `negozio_oid`  integer;
alter table `specifico`   add index fk_specifico_negozio (`negozio_oid`), add constraint fk_specifico_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);


-- Negozio_Categoria [rel31]
alter table `negozio`  add column  `categoria_prodotto_oid`  integer;
alter table `negozio`   add index fk_negozio_categoria_prodotto (`categoria_prodotto_oid`), add constraint fk_negozio_categoria_prodotto foreign key (`categoria_prodotto_oid`) references `categoria_prodotto` (`oid`);


-- Negozio_Indirizzo [rel32]
alter table `indirizzo`  add column  `negozio_oid`  integer;
alter table `indirizzo`   add index fk_indirizzo_negozio (`negozio_oid`), add constraint fk_indirizzo_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);


-- Negozio_Zona [rel33]
alter table `negozio`  add column  `zona_oid`  integer;
alter table `negozio`   add index fk_negozio_zona (`zona_oid`), add constraint fk_negozio_zona foreign key (`zona_oid`) references `zona` (`oid`);


-- Acquisto_Prenotazione [rel34]
alter table `prenotazione`  add column  `acquisto_oid`  integer;
alter table `prenotazione`   add index fk_prenotazione_acquisto (`acquisto_oid`), add constraint fk_prenotazione_acquisto foreign key (`acquisto_oid`) references `acquisto` (`oid`);


-- Gestore Catena_Utente Registrato [rel35]
create table `gestore_catena_utente_registra` (
   `gestore_catena_oid`  integer not null,
   `utente_registrato_oid`  integer not null,
  primary key (`gestore_catena_oid`, `utente_registrato_oid`)
);
alter table `gestore_catena_utente_registra`   add index fk_gestore_catena_utente_regis (`gestore_catena_oid`), add constraint fk_gestore_catena_utente_regis foreign key (`gestore_catena_oid`) references `gestore_catena` (`utente_registrato_oid`);
alter table `gestore_catena_utente_registra`   add index fk_gestore_catena_utente_reg_2 (`utente_registrato_oid`), add constraint fk_gestore_catena_utente_reg_2 foreign key (`utente_registrato_oid`) references `utente_registrato` (`oid`);


-- Catena Negozi_Indirizzo [rel36]
alter table `indirizzo`  add column  `catena_negozi_oid`  integer;
alter table `indirizzo`   add index fk_indirizzo_catena_negozi (`catena_negozi_oid`), add constraint fk_indirizzo_catena_negozi foreign key (`catena_negozi_oid`) references `catena_negozi` (`oid`);


-- Evento_Periodo [rel37]
alter table `evento`   add index fk_evento_periodo (), add constraint fk_evento_periodo foreign key () references `periodo` ();


-- Categoria Prodotto_Tipo prodotto [rel38]
alter table `tipo_prodotto`  add column  `categoria_prodotto_oid`  integer;
alter table `tipo_prodotto`   add index fk_tipo_prodotto_categoria_pro (`categoria_prodotto_oid`), add constraint fk_tipo_prodotto_categoria_pro foreign key (`categoria_prodotto_oid`) references `categoria_prodotto` (`oid`);


-- Tipo prodotto_Prodotto [rel39]
alter table `prodotto`  add column  `tipo_prodotto_oid`  integer;
alter table `prodotto`   add index fk_prodotto_tipo_prodotto (`tipo_prodotto_oid`), add constraint fk_prodotto_tipo_prodotto foreign key (`tipo_prodotto_oid`) references `tipo_prodotto` (`oid`);


-- Gestore Singolo Negozio_Negozio [rel4]
alter table `negozio`  add column  `gestore_singolo_negozio_oid`  integer;
alter table `negozio`   add index fk_negozio_gestore_singolo_neg (`gestore_singolo_negozio_oid`), add constraint fk_negozio_gestore_singolo_neg foreign key (`gestore_singolo_negozio_oid`) references `gestore_singolo_negozio` (`utente_registrato_oid`);


-- Evento_Tipo Evento [rel42]
create table `evento_tipo_evento` (
   `evento_oid`  integer not null,
   `tipo_evento_oid`  integer not null,
  primary key (`evento_oid`, `tipo_evento_oid`)
);
alter table `evento_tipo_evento`   add index fk_evento_tipo_evento_evento (`evento_oid`), add constraint fk_evento_tipo_evento_evento foreign key (`evento_oid`) references `evento` (`oid`);
alter table `evento_tipo_evento`   add index fk_evento_tipo_evento_tipo_eve (`tipo_evento_oid`), add constraint fk_evento_tipo_evento_tipo_eve foreign key (`tipo_evento_oid`) references `tipo_evento` (`oid`);


-- Gestore Singolo Negozio_Evento [rel5]
alter table `evento`  add column  `gestore_singolo_negozio_oid`  integer;
alter table `evento`   add index fk_evento_gestore_singolo_nego (`gestore_singolo_negozio_oid`), add constraint fk_evento_gestore_singolo_nego foreign key (`gestore_singolo_negozio_oid`) references `gestore_singolo_negozio` (`utente_registrato_oid`);


-- Evento_Prenotazione [rel6]
alter table `prenotazione`  add column  `evento_oid`  integer;
alter table `prenotazione`   add index fk_prenotazione_evento (`evento_oid`), add constraint fk_prenotazione_evento foreign key (`evento_oid`) references `evento` (`oid`);


-- Sala prove_Negozio [rel7]
alter table `negozio`  add column  `sala_prove_oid`  integer;
alter table `negozio`   add index fk_negozio_sala_prove (`sala_prove_oid`), add constraint fk_negozio_sala_prove foreign key (`sala_prove_oid`) references `sala_prove` (`oid`);


-- Negozio_Base [rel8]
alter table `negozio`  add column  `base_oid`  integer;
alter table `negozio`   add index fk_negozio_base (`base_oid`), add constraint fk_negozio_base foreign key (`base_oid`) references `base` (`catalogo_oid`);


-- Sala prove_Prenotazione [rel9]
alter table `prenotazione`  add column  `sala_prove_oid`  integer;
alter table `prenotazione`   add index fk_prenotazione_sala_prove (`sala_prove_oid`), add constraint fk_prenotazione_sala_prove foreign key (`sala_prove_oid`) references `sala_prove` (`oid`);


-- GEN FK: Base --> Catalogo
alter table `base`   add index fk_base_catalogo (`catalogo_oid`), add constraint fk_base_catalogo foreign key (`catalogo_oid`) references `catalogo` (`oid`);


-- GEN FK: Specifico --> Catalogo
alter table `specifico`   add index fk_specifico_catalogo (`catalogo_oid`), add constraint fk_specifico_catalogo foreign key (`catalogo_oid`) references `catalogo` (`oid`);


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


-- Migliori Prodotti [ent25]
create view `migliori_prodotti_view` as
select distinct AL1.`oid` as `oid`
from  `prodotto` AL1 
               left outer join `prodottotorecensione_view` AL2 on 
               left outer join `recensione` AL3 on AL2.``=AL3.`oid`
where AL3.`numero_stelle` >= 4;


-- Prodotto_Recensione [rel28]
create view `prodottotorecensione_view` as
select AL1.`oid` as `s_oid`, AL2.`oid` as `t_oid`
from  `prodotto` AL1 ,
         `recensione` AL2 
where AL2.`numero_stelle` >= 4;


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
               left outer join `negoziotorecensione_view` AL2 on AL1.`oid`=AL2.`s_oid`
               left outer join `recensione` AL3 on AL2.`t_oid`=AL3.`oid`
where AL3.`numero_stelle` >= 4;


