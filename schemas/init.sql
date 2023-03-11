create procedure init()
language plpgsql
as $$
declare
    default_client_id uuid;
    admin_user_id uuid;
begin
    -- create default client
    default_client_id := public.gen_random_uuid();
    admin_user_id := default_client_id;

    call client.client_add(
        default_client_id,
        'default',
        'default',
        'default client'
    );

    -- create admin user id
    call iam.user_add(
        admin_user_id,
        'admin@default.com',
        'admin'
    );
end
$$;

call init();
drop procedure init();