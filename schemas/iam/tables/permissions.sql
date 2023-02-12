create table permissions (
    id uuid not null,
    active boolean not null default false,
    created timestamp without time zone not null default(now() at time zone 'utc'),

    name varchar(100) not null,
    description text,

    constraint pk_permissions
        primary key (id),
    constraint u_permissions_1
        unique (name)
);