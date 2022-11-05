DROP DATABASE IF EXISTS enctestDB;
CREATE DATABASE IF NOT EXISTS enctestDB;

use enctestDB;
drop table if exists tb1;

create table tb1
(
    id varchar(10),
    name varchar(100),
    pass varchar(500),
    primary key(id)
);

insert into tb1 values ('dbs001','saerom', hex(aes_encrypt('pass001', 'a')));
insert into tb1 values ('dbs002', 'woojin',hex(aes_encrypt('pass002', 'b')));
insert into tb1 values ('dbs003', 'junyoung', hex(aes_encrypt('pass003', 'b')));

select * from tb1;

select name, aes_decrypt(unhex(pass), 'a') from tb1;
select name, aes_decrypt(unhex(pass), 'b') from tb1;

