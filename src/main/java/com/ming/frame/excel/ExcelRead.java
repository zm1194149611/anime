package com.ming.frame.excel;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.ming.frame.utils.DoubleUtil;

/**
 * @author RCZ
 * @time 2017年11月6日
 * @desc excel数据读取
 * @company cn.dh.itgroup
 * @project common
 */
public class ExcelRead {

	protected Workbook wb = null;

	int sheetCount = 0; // sheet 个数
	int sheetIndex = 0; // 当前sheetIndex
	int rowIndex = 0; // 当前行数
	int rowNum = 0; // 行数

	public void read(InputStream is) {
		POIFSFileSystem fs = null;
		try {
			fs = new POIFSFileSystem(is);
			wb = new HSSFWorkbook(fs);
			sheetCount = wb.getNumberOfSheets();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Workbook getWorkbook() {
		return wb;
	}

	Sheet sheet = null;

	public Sheet nextSheet() {
		if (sheetIndex < sheetCount) {
			sheet = wb.getSheetAt(sheetIndex);

		} else {
			return null;
		}
		sheetIndex++;

		rowNum = sheet.getLastRowNum();
		rowIndex = 0;
		return sheet;
	}

	public Sheet getSheet(int index) {
		sheet = wb.getSheetAt(index);
		sheetIndex = index;

		rowNum = sheet.getLastRowNum();
		rowIndex = 0;
		return sheet;
	}

	Row row = null;
	Cell cel = null;

	public List<String> nextColmun() {
		List<String> list = new ArrayList<String>();
		;
		if (rowIndex <= rowNum) {
			row = sheet.getRow(rowIndex);
			if (row != null) {
				int colNum = row.getPhysicalNumberOfCells();

				for (int i = 0; i < colNum; i++) {
					cel = row.getCell(i);
					list.add(getStringCellValue(cel));
				}
			} else {
				rowIndex++;
				return null;
			}
		} else {
			return null;
		}
		rowIndex++;
		return list;
	}

	public boolean hasNextColumn() {
		if (rowIndex <= rowNum) {
			return true;
		} else {
			return false;
		}
	}

	public List<String> getColumn(int index) {
		List<String> list = new ArrayList<String>();
		;
		if (index <= rowNum) {
			row = sheet.getRow(index);
			int colNum = row.getPhysicalNumberOfCells();

			for (int i = 0; i < colNum; i++) {
				cel = row.getCell(i);
				list.add(getStringCellValue(cel));
			}
		} else {
			return null;
		}
		rowIndex = index + 1;
		return list;
	}

	private String getStringCellValue(Cell cell) {
		String strCell = "";
		if (cell == null) {
			return "";
		}
		switch (cell.getCellType()) {
		case Cell.CELL_TYPE_STRING:
			strCell = cell.getStringCellValue();
			break;
		case Cell.CELL_TYPE_NUMERIC:
			strCell = getStringFromNumber(cell.getNumericCellValue());
			break;
		case Cell.CELL_TYPE_BOOLEAN:
			strCell = String.valueOf(cell.getBooleanCellValue());
			break;
		case Cell.CELL_TYPE_BLANK:
			strCell = "";
			break;
		default:
			strCell = "";
			break;
		}
		if (strCell.equals("") || strCell == null) {
			return "";
		}
		return strCell;
	}

	private String getStringFromNumber(double d) {
		if (d % 1 == 0) {
			return DoubleUtil.format(d, "#");
		}
		return DoubleUtil.format(d);
	}

}
