"""
TigerBeetle doesn't have a SQL interface, but is still a very cool
database.

    https://tigerbeetle.com/

Here's a sample using the Python client.
"""

import os

import tigerbeetle

TIGERBEETLE_PORT = os.getenv("TB_ADDRESS", "3000")
TIGERBEETLE_CLUSTER_ID = 0


def create_account(client: tigerbeetle.ClientSync):
    account = tigerbeetle.Account(
        id=tigerbeetle.id(),  # TigerBeetle time-based ID.
        debits_pending=0,
        debits_posted=0,
        credits_pending=0,
        credits_posted=0,
        user_data_128=0,
        user_data_64=0,
        user_data_32=0,
        ledger=1,
        code=718,
        flags=(
            tigerbeetle.AccountFlags.LINKED
            | tigerbeetle.AccountFlags.DEBITS_MUST_NOT_EXCEED_CREDITS
        ),
        timestamp=0,
    )

    return client.create_accounts([account])


def main() -> int:
    with tigerbeetle.ClientSync(
        cluster_id=TIGERBEETLE_CLUSTER_ID,
        replica_addresses=TIGERBEETLE_PORT,
    ) as client:
        print(create_account(client))

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
