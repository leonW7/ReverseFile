
CREATE TRIGGER "fk_loginSession_username_ins_on_loginSession" BEFORE INSERT ON loginSession FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.username IS NOT NULL) AND ((SELECT UserName FROM Users WHERE UserName = new.username) IS NULL))
                 THEN RAISE(ABORT, 'username violates foreign key Users(UserName)')
    END;
END;
CREATE TRIGGER "fk_loginSession_username_upd_on_loginSession" BEFORE UPDATE ON loginSession FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.username IS NOT NULL) AND ((SELECT UserName FROM Users WHERE UserName = new.username) IS NULL))
                 THEN RAISE(ABORT, 'username violates foreign key Users(UserName)')
    END;
END;
CREATE TRIGGER "fk_loginSession_username_del_on_users" BEFORE DELETE ON Users FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT username FROM loginSession WHERE username = old.username) IS NOT NULL)
                 THEN RAISE(ABORT, 'username violates foreign key loginSession(username)')
    END;
END;
CREATE TRIGGER "fk_loginSession_username_upd_on_users" BEFORE UPDATE ON Users FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.UserName != old.UserName) AND ((SELECT username FROM loginSession WHERE username = old.UserName) IS NOT NULL))
                 THEN RAISE(ABORT, 'username violates foreign key loginSession(username)')
    END;
END;


BEGIN TRANSACTION;


CREATE TRIGGER "oid_upd_route"  AFTER INSERT ON route  FOR EACH ROW
BEGIN
    
    UPDATE oidRecord SET OID = OID + 1 WHERE tableName = "route";
END;


COMMIT TRANSACTION;

