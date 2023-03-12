create procedure init()
language plpgsql
as $$
declare
    test_client_id uuid;
    test_user_id uuid;
begin
    test_client_id := public.gen_random_uuid();
    test_user_id := test_client_id;

    call client.client_add(
        test_client_id,
        'test',
        'test',
        'test client'
    );

    call client.client_set_active(
        test_client_id,
        true
    );

    call iam.user_add(
        test_user_id,
        'test@mailinator.com',
        'tester'
    );

    call iam.user_set_active(
        test_user_id,
        true
    );

    call people.people_add(
        test_user_id,
        'test',
        'test',
        'test',
        '',
        '',
        1, -- male
        2,
        2
    );
end
$$;

call init();
drop procedure init();