use enctestDB;

drop table if exists tb_enc;
create table tb_enc
(
    id varchar(10),
    name varchar(100),
    pass varchar(500),
    primary key(id)
) ENCRYPTION = 'Y';

select "Insert data into tb_enc" as "do";
insert into tb_enc values ('dbs001','saerom', hex(aes_encrypt('pass001', 'a')));
insert into tb_enc values ('dbs002', 'woojin',hex(aes_encrypt('pass002', 'b')));
insert into tb_enc values ('dbs003', 'junyoung', hex(aes_encrypt('pass003', 'b')));

select "Insert data into tb1" as "do";
insert into tb1 values ('dbs004', 'sujin', hex(aes_encrypt('pass004', 'a')));
insert into tb1 values ('dbs005', 'sujin', hex(aes_encrypt('pass004', 'c')));
insert into tb1 values ('dbs006', 'sujin', hex(aes_encrypt('pass004', 'c')));