package com.ming.frame.excel;

import java.io.IOException;
import java.io.InputStream;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class XExcelRead extends ExcelRead{
	
	public void read(InputStream is)
	{
		try {
            wb = new XSSFWorkbook(is);
            sheetCount = wb.getNumberOfSheets();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
}
