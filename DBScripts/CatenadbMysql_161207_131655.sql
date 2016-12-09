-- Catalogo Base_Categoria Prodotto [rel43]
alter table `categoria_prodotto`  add column  `catalogo_base_oid`  integer;
alter table `categoria_prodotto`   add index fk_categoria_prodotto_catalogo (`catalogo_base_oid`), add constraint fk_categoria_prodotto_catalogo foreign key (`catalogo_base_oid`) references `catalogo_base` (`catalogo_oid`);


