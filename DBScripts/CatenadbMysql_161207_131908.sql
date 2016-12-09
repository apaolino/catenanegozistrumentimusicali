-- Catalogo_Categoria Prodotto [rel44]
create table `catalogo_categoria_prodotto` (
   `catalogo_oid`  integer not null,
   `categoria_prodotto_oid`  integer not null,
  primary key (`catalogo_oid`, `categoria_prodotto_oid`)
);
alter table `catalogo_categoria_prodotto`   add index fk_catalogo_categoria_prodotto (`catalogo_oid`), add constraint fk_catalogo_categoria_prodotto foreign key (`catalogo_oid`) references `catalogo` (`oid`);
alter table `catalogo_categoria_prodotto`   add index fk_catalogo_categoria_prodot_2 (`categoria_prodotto_oid`), add constraint fk_catalogo_categoria_prodot_2 foreign key (`categoria_prodotto_oid`) references `categoria_prodotto` (`oid`);


