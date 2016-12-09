-- Utente Registrato.Indirizzo Primario [User#att71]
drop view `utente_registrato_indirizzo_pr`;
-- GEN FK: Cliente --> Utente Registrato
alter table `cliente`   drop foreign key `fk_cliente_utente_registrato`;
-- GEN FK: Gestore Singolo Negozio --> Utente Registrato
alter table `gestore_singolo_negozio`   drop foreign key `fk_gestore_singolo_negozio_ute`;
-- GEN FK: Gestore Catena --> Utente Registrato
alter table `gestore_catena`   drop foreign key `fk_gestore_catena_utente_reg_3`;
-- GEN FK: Prenotazione Noleggio Prodotto --> Prenotazione
alter table `prenotazione_noleggio_prodotto`   drop foreign key `fk_prenotazione_noleggio_prodo`;
-- GEN FK: Specifico --> Catalogo
alter table `specifico`   drop foreign key `fk_specifico_catalogo`;
-- GEN FK: Base --> Catalogo
alter table `base`   drop foreign key `fk_base_catalogo`;
-- Sala prove_Prenotazione [rel9]
alter table `prenotazione`   drop foreign key `fk_prenotazione_sala_prove`;
alter table `prenotazione`  drop column  `sala_prove_oid`;
-- Negozio_Base [rel8]
alter table `negozio`   drop foreign key `fk_negozio_base`;
alter table `negozio`  drop column  `base_oid`;
-- Sala prove_Negozio [rel7]
alter table `negozio`   drop foreign key `fk_negozio_sala_prove`;
alter table `negozio`  drop column  `sala_prove_oid`;
-- Evento_Prenotazione [rel6]
alter table `prenotazione`   drop foreign key `fk_prenotazione_evento`;
alter table `prenotazione`  drop column  `evento_oid`;
-- Gestore Singolo Negozio_Evento [rel5]
alter table `evento`   drop foreign key `fk_evento_gestore_singolo_nego`;
alter table `evento`  drop column  `gestore_singolo_negozio_oid`;
-- Evento_Tipo Evento [rel42]
alter table `evento_tipo_evento`   drop foreign key `fk_evento_tipo_evento_tipo_eve`;
alter table `evento_tipo_evento`   drop foreign key `fk_evento_tipo_evento_evento`;
drop table `evento_tipo_evento`;
-- Evento_Periodo [rel41]
alter table `evento`   drop foreign key `fk_evento_periodo`;
alter table `evento`  drop column  `periodo_oid`;
-- Gestore Singolo Negozio_Negozio [rel4]
alter table `negozio`   drop foreign key `fk_negozio_gestore_singolo_neg`;
alter table `negozio`  drop column  `gestore_singolo_negozio_oid`;
-- Tipo prodotto_Prodotto [rel39]
alter table `prodotto`   drop foreign key `fk_prodotto_tipo_prodotto`;
alter table `prodotto`  drop column  `tipo_prodotto_oid`;
-- Categoria Prodotto_Tipo prodotto [rel38]
alter table `tipo_prodotto`   drop foreign key `fk_tipo_prodotto_categoria_pro`;
alter table `tipo_prodotto`  drop column  `categoria_prodotto_oid`;
-- Catena Negozi_Indirizzo [rel36]
alter table `indirizzo`   drop foreign key `fk_indirizzo_catena_negozi`;
alter table `indirizzo`  drop column  `catena_negozi_oid`;
-- Gestore Catena_Utente Registrato [rel35]
alter table `gestore_catena_utente_registra`   drop foreign key `fk_gestore_catena_utente_reg_2`;
alter table `gestore_catena_utente_registra`   drop foreign key `fk_gestore_catena_utente_regis`;
drop table `gestore_catena_utente_registra`;
-- Acquisto_Prenotazione [rel34]
alter table `prenotazione`   drop foreign key `fk_prenotazione_acquisto`;
alter table `prenotazione`  drop column  `acquisto_oid`;
-- Negozio_Zona [rel33]
alter table `negozio`   drop foreign key `fk_negozio_zona`;
alter table `negozio`  drop column  `zona_oid`;
-- Negozio_Indirizzo [rel32]
alter table `indirizzo`   drop foreign key `fk_indirizzo_negozio`;
alter table `indirizzo`  drop column  `negozio_oid`;
-- Negozio_Categoria [rel31]
alter table `negozio`   drop foreign key `fk_negozio_categoria_prodotto`;
alter table `negozio`  drop column  `categoria_prodotto_oid`;
-- Negozio_Specifico [rel30]
alter table `specifico`   drop foreign key `fk_specifico_negozio`;
alter table `specifico`  drop column  `negozio_oid`;
-- Gestore Singolo Negozio_Specifico [rel3]
alter table `specifico`   drop foreign key `fk_specifico_gestore_singolo_n`;
alter table `specifico`  drop column  `gestore_singolo_negozio_oid`;
-- Produttore_Prodotto [rel29]
alter table `prodotto`   drop foreign key `fk_prodotto_produttore`;
alter table `prodotto`  drop column  `produttore_oid`;
-- Cliente Registrato_Carta di Credito [rel27]
alter table `carta_di_credito`   drop foreign key `fk_carta_di_credito_cliente`;
alter table `carta_di_credito`  drop column  `cliente_oid`;
-- Catena Negozi_Base [rel26]
alter table `base`   drop foreign key `fk_base_catena_negozi`;
alter table `base`  drop column  `catena_negozi_oid`;
-- Prodotto_Categoria [rel25]
alter table `prodotto`   drop foreign key `fk_prodotto_categoria_prodotto`;
alter table `prodotto`  drop column  `categoria_prodotto_oid`;
-- Catalogo_Prodotto [rel24]
alter table `catalogo_prodotto`   drop foreign key `fk_catalogo_prodotto_prodotto`;
alter table `catalogo_prodotto`   drop foreign key `fk_catalogo_prodotto_catalogo`;
drop table `catalogo_prodotto`;
-- Negozio_Catalogo [rel23]
alter table `negozio_catalogo`   drop foreign key `fk_negozio_catalogo_catalogo`;
alter table `negozio_catalogo`   drop foreign key `fk_negozio_catalogo_negozio`;
drop table `negozio_catalogo`;
-- Catena Negozi_Negozio [rel22]
alter table `negozio`   drop foreign key `fk_negozio_catena_negozi`;
alter table `negozio`  drop column  `catena_negozi_oid`;
-- Valutazione_Prodotto [rel21]
alter table `recensione`   drop foreign key `fk_recensione_prodotto`;
alter table `recensione`  drop column  `prodotto_oid`;
-- Indirizzo_User [rel20]
alter table `utente_registrato`   drop foreign key `fk_utente_registrato_indirizzo`;
alter table `utente_registrato`  drop column  `indirizzo_oid`;
-- Gestore Catena_Base [rel2]
alter table `base`   drop foreign key `fk_base_gestore_catena`;
alter table `base`  drop column  `gestore_catena_oid`;
-- Valutazione_Cliente Registrato [rel19]
alter table `recensione`   drop foreign key `fk_recensione_cliente`;
alter table `recensione`  drop column  `cliente_oid`;
-- Valutazione_Negozio [rel18]
alter table `recensione`   drop foreign key `fk_recensione_negozio`;
alter table `recensione`  drop column  `negozio_oid`;
-- Cliente Registrato_Acquisto [rel17]
alter table `acquisto`   drop foreign key `fk_acquisto_cliente`;
alter table `acquisto`  drop column  `cliente_oid`;
-- Acquisto_Negozio [rel16]
alter table `acquisto`   drop foreign key `fk_acquisto_negozio`;
alter table `acquisto`  drop column  `negozio_oid`;
-- Acquisto_Prodotto [rel15]
alter table `acquisto_prodotto`   drop foreign key `fk_acquisto_prodotto_prodotto`;
alter table `acquisto_prodotto`   drop foreign key `fk_acquisto_prodotto_acquisto`;
drop table `acquisto_prodotto`;
-- Cliente Registrato_Prenotazione [rel14]
alter table `cliente`   drop foreign key `fk_cliente_prenotazione`;
alter table `cliente`  drop column  `prenotazione_oid`;
-- Prenotazione_Gestore Singolo Negozio [rel13]
alter table `gestore_singolo_negozio`   drop foreign key `fk_gestore_singolo_negozio_pre`;
alter table `gestore_singolo_negozio`  drop column  `prenotazione_oid`;
-- Prenotazione_Prodotto [rel12]
alter table `prenotazione_prodotto`   drop foreign key `fk_prenotazione_prodotto_prodo`;
alter table `prenotazione_prodotto`   drop foreign key `fk_prenotazione_prodotto_preno`;
drop table `prenotazione_prodotto`;
-- Prenotazione_Negozio [rel11]
alter table `prenotazione`   drop foreign key `fk_prenotazione_negozio`;
alter table `prenotazione`  drop column  `negozio_oid`;
-- Evento_Negozio [rel10]
alter table `evento`   drop foreign key `fk_evento_negozio`;
alter table `evento`  drop column  `negozio_oid`;
-- Catena Negozi_Gestore Catena [rel1]
alter table `gestore_catena`   drop foreign key `fk_gestore_catena_catena_negoz`;
alter table `gestore_catena`  drop column  `catena_negozi_oid`;
-- User_Group [User2Group_Group2User]
alter table `user_group`   drop foreign key `fk_user_group_group`;
alter table `user_group`   drop foreign key `fk_user_group_utente_registrat`;
drop table `user_group`;
-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `utente_registrato`   drop foreign key `fk_utente_registrato_group`;
alter table `utente_registrato`  drop column  `group_oid`;
-- Group_Module [Group2Module_Module2Group]
alter table `group_module`   drop foreign key `fk_group_module_module`;
alter table `group_module`   drop foreign key `fk_group_module_group`;
drop table `group_module`;
-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`   drop foreign key `fk_group_module`;
alter table `group`  drop column  `module_oid`;
-- Catena Negozi [ent9]
drop table `catena_negozi`;
-- Cliente [ent8]
drop table `cliente`;
-- Categoria Prodotto [ent7]
drop table `categoria_prodotto`;
-- Gestore Singolo Negozio [ent6]
drop table `gestore_singolo_negozio`;
-- Gestore Catena [ent5]
drop table `gestore_catena`;
-- Tipo prodotto [ent4]
drop table `tipo_prodotto`;
-- Zona [ent3]
drop table `zona`;
-- Tipo Evento [ent26]
drop table `tipo_evento`;
-- Periodo [ent22]
drop table `periodo`;
-- Prenotazione Noleggio Prodotto [ent21]
drop table `prenotazione_noleggio_prodotto`;
-- Produttore [ent20]
drop table `produttore`;
-- Carta di Credito [ent2]
drop table `carta_di_credito`;
-- Sala prove [ent19]
drop table `sala_prove`;
-- Recensione [ent18]
drop table `recensione`;
-- Evento [ent17]
drop table `evento`;
-- Prenotazione [ent16]
drop table `prenotazione`;
-- Acquisto [ent15]
drop table `acquisto`;
-- Specifico [ent14]
drop table `specifico`;
-- Base [ent13]
drop table `base`;
-- Prodotto [ent12]
drop table `prodotto`;
-- Catalogo [ent11]
drop table `catalogo`;
-- Negozio [ent10]
drop table `negozio`;
-- Indirizzo [ent1]
drop table `indirizzo`;
-- Utente Registrato [User]
drop table `utente_registrato`;
-- Module [Module]
drop table `module`;
-- Group [Group]
drop table `group`;
