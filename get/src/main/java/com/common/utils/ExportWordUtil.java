package com.common.utils;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * @author: hqs
 * @Date: 2018/12/14 11:48
 * @Description:
 */
public class ExportWordUtil {
    private final static String EXCEL2003L = ".xls";    //2003- 版本的excel
    private final static String EXCEL2007U = ".xlsx";   //2007+ 版本的excel

    public static void downloadExce(HttpServletResponse response, List<List<?>> list, List<String[]> topList, List<String[]> fieldList, String fileName) {
        try {
            fileName = fileName + "_.xls";
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            //写入数据
            writeFile(list, topList, fieldList, fileName, os);
            InputStream is = new ByteArrayInputStream(os.toByteArray());
            //下载文件
            runDownload(response, is, fileName, false);

            System.out.println("导出成功!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 写入文件
     *
     * @param list     数据内容
     * @param fileName 文件名称
     * @param out      输出流
     * @return 文件名
     * @throws IOException
     */
    public static String writeFile(List<List<?>> list, List<String[]> topList, List<String[]> fieldList, String fileName, OutputStream out)
            throws IOException {
        Row row = null;
        Workbook wb = null;
        if (StringUtils.isBlank(fileName)) {
            fileName = "兴业银行订单文件";
        }
        try {
            wb = new HSSFWorkbook();
            // 创建表头style
            HSSFCellStyle cellStyleTitle = (HSSFCellStyle) wb.createCellStyle();
            cellStyleTitle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND); // 填充单元格
            cellStyleTitle.setFillForegroundColor(HSSFColor.WHITE.index);
            cellStyleTitle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// //居中显示
            cellStyleTitle.setBorderBottom(HSSFCellStyle.BORDER_THIN);// 下边框
            cellStyleTitle.setBorderLeft(HSSFCellStyle.BORDER_THIN);// 左边框
            cellStyleTitle.setBorderRight(HSSFCellStyle.BORDER_THIN);// 右边框
            cellStyleTitle.setBorderTop(HSSFCellStyle.BORDER_THIN);// 上边框
            Font font = wb.createFont();
            font.setFontHeightInPoints((short) 14);// 设置字体大小
            font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//粗体
            cellStyleTitle.setFont(font);

            int z = 0;
            int i = 0;
            Sheet sheet = wb.createSheet(fileName);
            for (List<?> objects : list) {

                String top[] = topList.get(i);
                String field[] = fieldList.get(i);

                if (ArrayUtils.isEmpty(top) || ArrayUtils.isEmpty(field)) {
                    continue;
                }

                for (int m = 0; m < top.length; m++) {
                    sheet.setColumnWidth(m, top[m].getBytes().length * 2 * 256);
                }
                sheet.setColumnWidth(2, 40 * 256);
                int colspanNum = 0;
                //设置头部
                if (!ArrayUtils.isEmpty(top)) {
                    row = sheet.createRow((short) (z));
                    for (String aTop : top) {
                        Cell cell = row.createCell((short) colspanNum++);
                        cell.setCellStyle(cellStyleTitle);
                        cell.setCellValue(aTop);
                    }

                    z++;
                }
                //数据内容
                for (Object obj : objects) {
                    colspanNum = 0;
                    row = sheet.createRow((short) (z));
                    row.setHeightInPoints(20);
                    JSONObject js = (JSONObject) JSONObject.toJSON(obj);
                    for (String c : field) {
                        String cellValue = "";
                        Object o = js.get(c);
                        if (o == null) {
                            cellValue = "";
                        } else if (o instanceof Date) {
                            cellValue = new SimpleDateFormat("yyyy-MM-dd").format(o);
                        } else if (o instanceof BigDecimal) {
                            cellValue = ((BigDecimal) o).setScale(2, BigDecimal.ROUND_HALF_UP).toString();
                        } else {
                            cellValue = o.toString();
                        }
                        row.createCell((short) colspanNum++).setCellValue(cellValue);
                    }

                    z++;
                }

                z = z + 3;
                i++;
            }
            out.flush();
            wb.write(out);
            out.close();
        } catch (Exception e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        } finally {
            if (out != null) {
                out.close();
            }
        }
        return fileName;
    }

    private static void runDownload(HttpServletResponse response, InputStream ins, String fileName, boolean bl)
            throws IOException {
        String ext = fileName.substring(fileName.lastIndexOf(".") + 1).toUpperCase();
        if (bl) {//ture浏览器本地打开   false浏览器本地下载
            response.setHeader("Content-Disposition", "inline; filename=" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1"));
        } else {
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1"));
        }
        response.addHeader("Content-Length", "");
        response.setContentType("application/" + ext + ";charset=UTF-8");
        BufferedInputStream input = new BufferedInputStream(ins);
        byte[] buffer = new byte[input.available()];
        OutputStream os = response.getOutputStream();
        int read = 0;
        while ((read = input.read(buffer)) > 0) {
            os.write(buffer, 0, read);
            os.flush();
        }
        input.close();
        os.close();
    }

    /**
     * 获取IO流中的数据，组装成List<List<Object>>对象
     *
     * @param in
     * @param fileName 文件名
     * @return
     * @throws Exception
     */
    public static List<List<Object>> getBankListByExcel(InputStream in, String fileName) throws Exception {
        List<List<Object>> list = null;

        //创建Excel工作薄
        Workbook work = getWorkbook(in, fileName);
        if (null == work) {
            throw new Exception("创建Excel工作薄为空！");
        }
        Sheet sheet = null;
        Row row = null;
        Cell cell = null;

        list = new ArrayList<List<Object>>();
        //遍历Excel中所有的sheet
        for (int i = 0; i < work.getNumberOfSheets(); i++) {
            sheet = work.getSheetAt(i);
            if (sheet == null) {
                continue;
            }

            //遍历当前sheet中的所有行
            for (int j = sheet.getFirstRowNum(); j < (sheet.getLastRowNum() + 1); j++) {
                row = sheet.getRow(j);
                if (row == null || row.getFirstCellNum() == j) {
                    continue;
                }

                //遍历所有的列
                List<Object> li = new ArrayList<Object>();
                for (int y = row.getFirstCellNum(); y < row.getLastCellNum(); y++) {
                    cell = row.getCell(y);
                    Object object = getCellValue(cell);
                    if (object == null || object.equals("")) {
                        break;
                    }
                    li.add(object);
                }
                if (li.size() > 0) {
                    list.add(li);
                }
            }
        }
        return list;
    }

    /**
     * 根据文件后缀，自适应上传文件的版本
     *
     * @param inStr,fileName
     * @return
     * @throws Exception
     */
    public static Workbook getWorkbook(InputStream inStr, String fileName) throws Exception {
        Workbook wb = null;
        String fileType = fileName.substring(fileName.lastIndexOf("."));
        if (EXCEL2003L.equals(fileType)) {
            wb = new HSSFWorkbook(inStr);
        } else if (EXCEL2007U.equals(fileType)) {
            wb = new XSSFWorkbook(inStr);
        } else {
            throw new Exception("解析的文件格式有误！");
        }
        return wb;
    }

    /**
     * 对表格中数值进行格式化
     *
     * @param cell
     * @return
     */
    public static Object getCellValue(Cell cell) {
        Object value = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");  //日期格式化
        switch (cell.getCellType()) {
            case Cell.CELL_TYPE_STRING:
                value = cell.getRichStringCellValue().getString();
                break;
            case Cell.CELL_TYPE_NUMERIC:
                if ("General".equals(cell.getCellStyle().getDataFormatString())) {
                    value = BigDecimal.valueOf(cell.getNumericCellValue());
                } else if ("m/d/yy".equals(cell.getCellStyle().getDataFormatString())) {
                    value = sdf.format(cell.getDateCellValue());
                } else {
                    value = BigDecimal.valueOf(cell.getNumericCellValue());
                }
                break;
            case Cell.CELL_TYPE_BOOLEAN:
                value = cell.getBooleanCellValue();
                break;
            case Cell.CELL_TYPE_BLANK:
                value = "";
                break;
            default:
                break;
        }
        return value;
    }
}
