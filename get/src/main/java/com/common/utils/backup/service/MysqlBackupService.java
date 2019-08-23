package com.common.utils.backup.service;

/*
 * @author
 * @email
 * @date 2018-10-22
 */

public interface MysqlBackupService {

    void tableBackup(String... tableNames);

    void dbBackup();

    void dbRecover(String date);

}
