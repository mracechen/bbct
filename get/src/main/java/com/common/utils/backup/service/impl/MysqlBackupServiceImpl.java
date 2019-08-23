package com.common.utils.backup.service.impl;

import com.common.utils.DateUtils;
import com.common.utils.StringUtils;
import com.common.utils.backup.dao.OpLogDao;
import com.common.utils.backup.domain.OpLogDo;
import com.common.utils.backup.service.MysqlBackupService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.Arrays;
import java.util.Date;

/**
 * @author
 * @email
 * @date 2018-10-22
 */

@Service
public class MysqlBackupServiceImpl implements MysqlBackupService {
    private static Logger logger = LoggerFactory.getLogger(MysqlBackupServiceImpl.class);
    /**
     * 数据库表备份
     *
     * @throws Exception
     */

    @Value("${configs.db.dbHost}")
    private String dbHost;
    @Value("${configs.db.username}")
    private String dbUser;
    @Value("${configs.db.password}")
    private String dbPass;
    @Value("${configs.db.port}")
    private String dbPort;
    @Value("${configs.db.dbname}")
    private String dbName;
    @Value("${configs.db.savePath}")
    private String savePath;
    @Value("${configs.db.commandPath}")
    private String commandPath;

    @Autowired
    private OpLogDao opLogDao;

    /**
     * 备份数据库表
     *
     * @param tableNames 表名
     */

    @Override
    public void tableBackup(String... tableNames) {
        if (checkParam()) {
            return;
        }
        InputStream inputStream = null;
        InputStreamReader reader = null;
        BufferedReader br = null;
        FileOutputStream fileOutputStream = null;
        OpLogDo opLogDo = new OpLogDo();
        String date = DateUtils.dateFormat(DateUtils.dateAddDays(new Date(), -1), DateUtils.DATE_PATTERN_TWO);
        try {
            String fileName = savePath + date + ".sql";
            File file = new File(fileName);
            if (file.exists() && file.isFile()) {
                file.delete();
            }
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdir();
            }

            StringBuffer tableName = new StringBuffer();
            Arrays.stream(tableNames).forEach(m -> tableName.append(" ").append(m));

            Runtime runtime = Runtime.getRuntime();
            // -u后面是用户名，-p是密码，-family是数据库的名字
            String command = commandPath + "mysqldump -h" + dbHost + (StringUtils.isBlank(dbPort) ? "-P3306" : " -P" + dbPort) + " -u" + dbUser + (StringUtils.isBlank(dbPass) ? "" : " -p" + dbPass) + " --single-transaction " + dbName + tableName.toString();
            logger.info("command：" + command);
            Process process = runtime.exec(command);
            // 得到输入流，写成.sql文件
            inputStream = process.getInputStream();
            reader = new InputStreamReader(inputStream);
            br = new BufferedReader(reader);
            String s;
            StringBuilder sb = new StringBuilder();
            while ((s = br.readLine()) != null) {
                sb.append(s).append("\r\n");
            }
            s = sb.toString();
            if(org.apache.commons.lang3.StringUtils.isBlank(s)){
                throw new RuntimeException("备份失败独处数据为0,可能是数据库密码错误");
            }
            fileOutputStream = new FileOutputStream(file);
            fileOutputStream.write(s.getBytes());
            logger.info("---开始插入备份日志---");
            opLogDo.setOperation("备份成功");
            int length = s.getBytes().length;
            setFileSize(opLogDo, length);
            opLogDo.setTableNames(tableName.toString());
            opLogDo.setOperationTime(date);
            opLogDo.setFileName(fileName);
            logger.info("---成功插入备份日志---");
        } catch (Exception e) {
            logger.info("---插入备份日志失败---");
            opLogDo.setOperation("备份失败");
            opLogDo.setOperationTime(date);
            opLogDo.setFileName("");
        } finally {
            opLogDao.insertOpLog(opLogDo);
            closeStream(fileOutputStream, inputStream, reader, br);
        }
    }

    /**
     * 备份数据库
     */
    @Override
    public void dbBackup() {
        if (checkParam()) {
            return;
        }
        FileOutputStream fileOutputStream = null;
        InputStream inputStream = null;
        InputStreamReader reader = null;
        BufferedReader br = null;
        OpLogDo opLogDo = new OpLogDo();
        String date = DateUtils.dateFormat(DateUtils.dateAddDays(new Date(), -1), DateUtils.DATE_PATTERN_TWO);
        // -u后面是用户名，-p是密码
        try {
            String fileName = savePath + date +".sql";
            File file = new File(fileName);
            if (file.exists() && file.isFile()) {
                file.delete();
            }
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdir();
            }

            String command = commandPath + "mysqldump --add-drop-table " + "-h " + dbHost + (StringUtils.isBlank(dbPort) ? "-P3306" : " -P" + dbPort) + " -u " + dbUser + (StringUtils.isBlank(dbPass) ? "" : " -p" + dbPass) +" --single-transaction --databases " + dbName;
            logger.info("command：" + command);
            Runtime runtime = Runtime.getRuntime();
            Process process = runtime.exec(command);
            // 得到输入流，写成.sql文件
            inputStream = process.getInputStream();
            reader = new InputStreamReader(inputStream);
            br = new BufferedReader(reader);
            String s;
            StringBuilder sb = new StringBuilder();
            while ((s = br.readLine()) != null) {
                sb.append(s).append("\r\n");
            }
            s = sb.toString();
            if(org.apache.commons.lang3.StringUtils.isBlank(s)){
                throw new RuntimeException("备份失败独处数据为0,可能是数据库密码错误");
            }
            fileOutputStream = new FileOutputStream(file);
            fileOutputStream.write(s.getBytes());
            logger.info("---开始插入备份日志---");
            opLogDo.setOperation("备份成功");
            opLogDo.setOperationTime(date);
            int length = s.getBytes().length;
            setFileSize(opLogDo, length);
            opLogDo.setTableNames("数据库备份");
            opLogDo.setFileName(fileName);
            logger.info("---成功插入备份日志---");
        } catch (Exception e) {
            logger.info("---插入备份日志失败---");
            opLogDo.setOperation("备份失败");
            opLogDo.setOperationTime(date);
            opLogDo.setFileName("");
            logger.error(e.getMessage());
        } finally {
            opLogDao.insertOpLog(opLogDo);
            closeStream(fileOutputStream, inputStream, reader, br);
        }
    }

    private void setFileSize(OpLogDo opLogDo, int length) {
        if (length < 1024) {
            opLogDo.setFileSize("" + length + "B");
        } else if (length < 1048576) {
            opLogDo.setFileSize("" + length / 1024 + "KB");
        } else if (length < 1073741824) {
            opLogDo.setFileSize("" + length / 1048576 + "MB");
        } else {
            opLogDo.setFileSize("" + length / 1073741824 + "GB");
        }
    }

    private boolean checkParam() {
        if (StringUtils.isBlank(dbHost)) {
            logger.error("需要备份的主机没有配置！请检查");
            return true;
        }
        if (StringUtils.isBlank(dbUser)) {
            logger.error("需要备份的主机用户名没有配置！请检查");
            return true;
        }
        if (StringUtils.isBlank(dbName)) {
            logger.error("需要备份的主机数据库没有配置！请检查");
            return true;
        }
        return false;
    }

    private void closeStream(FileOutputStream fileOutputStream, InputStream inputStream, InputStreamReader reader, BufferedReader br) {
        try {
            if (fileOutputStream != null) {
                fileOutputStream.close();
            }
            if (br != null) {
                br.close();
            }
            if (reader != null) {
                reader.close();
            }
            if (inputStream != null) {
                inputStream.close();
            }
        } catch (IOException e) {
            logger.error(e.getMessage());
        }
    }

    /**
     * 执行sql文件,数据恢复
     */
    @Override
    public void dbRecover(String sqlFileName) {
        OutputStreamWriter writer = null;
        OutputStream outputStream = null;
        BufferedReader br = null;

        OpLogDo opLogDo = new OpLogDo();
        try {
            logger.info("---开始恢复备份---");
            //先恢复最近一次全备
            String command = commandPath + "mysql -h" + dbHost + (StringUtils.isBlank(dbPort) ? "-P3306" : " -P" + dbPort) + " -u" + dbUser + (StringUtils.isBlank(dbPass) ? "" : " -p" + dbPass) + " --default-character-set=utf8 " + dbName;
            logger.info("command：" + command);
            Runtime runtime = Runtime.getRuntime();
            Process process = runtime.exec(command);

            outputStream = process.getOutputStream();
            String fileName = savePath + sqlFileName;

            File file = new File(fileName);
            if (!file.isFile()) {
                logger.info("备份：" + fileName + "不存在！请检查");
                return;
            }
            br = new BufferedReader(new InputStreamReader(new FileInputStream(fileName), "utf-8"));
            String str;
            String logName;
            StringBuilder sb = new StringBuilder();
            while ((str = br.readLine()) != null) {
                sb.append(str).append("\r\n");
                if (str.startsWith("-- CHANGE MASTER")) {
                    logName = str.substring(str.indexOf("'") + 1, str.lastIndexOf("'"));
                    System.out.println(logName);
                }
            }
            str = sb.toString();
            writer = new OutputStreamWriter(outputStream, "utf-8");
            writer.write(str);
            writer.flush();

            opLogDo.setOperation("恢复备份成功");
            opLogDo.setOperationTime(DateUtils.dateFormat(new Date(), DateUtils.DATE_PATTERN_TWO));
            opLogDo.setFileName(fileName);
            logger.info("---成功恢复备份---");
        } catch (Exception e) {
            logger.info("---恢复备份失败---");
            opLogDo.setOperation("恢复备份失败");
            opLogDo.setOperationTime(DateUtils.dateFormat(new Date(), DateUtils.DATE_PATTERN_TWO));
            opLogDo.setFileName("");
            logger.error(e.getMessage());
        } finally {
            opLogDao.insertOpLog(opLogDo);
            try {
                if (outputStream != null) {
                    outputStream.close();
                }
                if (br != null) {
                    br.close();
                }
                if (writer != null) {
                    writer.close();
                }
            } catch (IOException e) {
                logger.error(e.getMessage());
            }
        }
    }
}
