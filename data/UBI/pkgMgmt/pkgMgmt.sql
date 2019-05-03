BEGIN;
create table pkgMgmtSource (
    sourceName      text,
    uri             text NOT NULL,
    encKey          text, -- AES key for package encryption/decryption
    publicKey       text  -- RSA public key for repository authentication
    );

create table pkgMgmtRepo (
    sourceName      text NOT NULL,
    Package         text NOT NULL,
    Priority        text,
    Section         text,
    InstalledSize   int,
    Version         text,
    Depends         text,
    Conflicts       text,
    Filename        text,
    Size            integer,
    MD5sum          text,
    SHA1            text,
    SHA256          text,
    Description     text
    );

create table pkgInstalled (
    sourceName      text, -- repo name from which this package is installed
    Package         text NOT NULL,
    InstalledSize   int,
    Version         text,
    baseVersion     text,   --version of the package in the firmware
    Depends         text,
    Description     text,
    status          text,
    installType     int     -- 0 for default installed and nil  for packagemanager
    );

create table pkgInstallHistory (
    textMessage text NOT NULL,
    time        text NOT NULL
    );
CREATE TABLE tableDefaults
(
	tableName  text NOT NULL,
	columnName  text NOT NULL,
	defValue  text ,
	minValue  text ,
	maxValue  text ,
	PRIMARY KEY (tableName,columnName)
)
;
insert into pkgMgmtSource values ('D-Link','http://mydsr.dlink.com.tw/driver/','/pfrm2.0/pkgMgmt/pserver.key', '/pfrm2.0/pkgMgmt/pserver.key');
CREATE TABLE Languages
(
    LanguageId text NOT NULL,
    LanguageName text NOT NULL,
    FileName text NOT NULL,
    Status boolean NOT NULL,
    PRIMARY KEY (LanguageId)
);

INSERT INTO Languages (LanguageId, LanguageName, FileName, Status) values ("en_US", "English", "", "1");
COMMIT;
