BEGIN;
CREATE TABLE CPAccInfoIP(
    UserName text NOT NULL,
    ipAddress text NOT NULL,
    currentTimeUsage integer NOT NULL
    );

CREATE TABLE CPAccInfoUserAccount(
    UserName text NOT NULL,
    currentTimeUsage integer NOT NULL,
    currentTrafficUsage text NOT NULL
    );
COMMIT;
