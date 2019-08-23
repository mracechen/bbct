package com.common.utils.backup.domain;

/*
 * @author
 * @email
 * @date 2018-10-22
 */

public class OpLogDo {

    /**
     * 日志id
     */
    private int id;
    /**
     * 操作类型
     */
    private String operation;
    /**
     * 操作时间
     */
    private String operationTime;
    /**
     * 备份文件名
     */
    private String fileName;

    /**
     * 备份文件大小
     */
    private String fileSize;

    /**
     * 备份的内容
     * @return
     */

    private String tableNames;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getOperationTime() {
        return operationTime;
    }

    public void setOperationTime(String operationTime) {
        this.operationTime = operationTime;
    }

    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }

    public String getTableNames() {
        return tableNames;
    }

    public void setTableNames(String tableNames) {
        this.tableNames = tableNames;
    }
}
