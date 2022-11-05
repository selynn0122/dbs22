select hex('test');
select unhex(hex('test'));

select aes_encrypt('test','pss');
select aes_decrypt(aes_encrypt('test','pss'),'pss');

select hex(aes_encrypt('test','pss'));

