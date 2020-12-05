--liquibase formatted sql

--changeset utamas:update_greeting_stlye splitStatements:false rollbackSplitStatements:false

create or replace function greet(name text)
    returns text
    language plpgsql
as
$$
begin
    return format('Hello %1$s', name);
end;
$$;

--rollback create or replace function greet(name text)
--rollback     returns text
--rollback     language plpgsql
--rollback as
--rollback $$
--rollback begin
--rollback     return format('Welcome %1$s', name);
--rollback end;
--rollback $$

--changeset utamas:some_other_change

create table greeting_prefixes
(
    prefix text
);

--rollback drop table greeting_prefixes;
