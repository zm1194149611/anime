package com.ming.frame.excel;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.LinkedList;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;

import com.ming.frame.utils.DateUtil;
import com.ming.frame.utils.DoubleUtil;
import com.ming.frame.utils.IntegerUtil;

/**
 * @author RCZ
 * @time 2017年11月6日
 * @desc excel
 * @company cn.dh.itgroup
 * @project common
 */
public class Excel {

	protected HSSFWorkbook wb = null;
	protected CellStyle headerStyle = null;
	protected CellStyle columnStyle = null;
	protected CellStyle numStyle = null;
	protected int rowNum = 0;

	protected LinkedList<HSSFSheet> sheets = new LinkedList<HSSFSheet>();

	public Excel() {
		wb = new HSSFWorkbook();
		Font fontHeader = createFonts(wb, Font.BOLDWEIGHT_BOLD, "宋体", false, (short) 200);
		Font fontCell = createFonts(wb, Font.BOLDWEIGHT_NORMAL, "宋体", false, (short) 200);

		headerStyle = wb.createCellStyle();
		headerStyle.setAlignment(CellStyle.ALIGN_CENTER);
		headerStyle.setVerticalAlignment(CellStyle.VERTICAL_BOTTOM);
		headerStyle.setFillBackgroundColor(HSSFColor.GREY_25_PERCENT.index);
		headerStyle.setFont(fontHeader);

		columnStyle = wb.createCellStyle();
		columnStyle.setAlignment(CellStyle.ALIGN_CENTER);
		columnStyle.setVerticalAlignment(CellStyle.VERTICAL_BOTTOM);
		columnStyle.setFont(fontCell);

		numStyle = wb.createCellStyle();
		numStyle.setAlignment(CellStyle.ALIGN_RIGHT);
		numStyle.setVerticalAlignment(CellStyle.VERTICAL_BOTTOM);
		numStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("0.00"));
		numStyle.setFont(fontCell);
	}

	protected Integer columnNum = null;

	public HSSFWorkbook getWorkbook() {
		return wb;
	}

	protected String sheetName = null;

	public HSSFSheet createSheet() {
		HSSFSheet st = wb.createSheet();
		sheets.addLast(st);
		return st;
	}

	public HSSFSheet createSheet(String sheetname) {
		HSSFSheet st = null;
		if (null == sheetname) {
			st = createSheet();
		} else {
			sheetName = sheetname;
			st = wb.createSheet(sheetname);
		}
		sheets.addLast(st);
		return st;
	}

	protected String[] sheetheader = null;

	public void addHeaders(String[] header) {
		sheetheader = header;
		HSSFRow row = sheets.getLast().createRow(rowNum);

		columnNum = header.length;
		for (int i = 0; i < columnNum; i++) {
			sheets.getLast().setColumnWidth(i, 20 * 256);
			createCell(row, i, header[i], headerStyle);
		}
		rowNum++;
	}

	public void addColumns(String[] columns) {
		HSSFRow row = sheets.getLast().createRow(rowNum);
		String value = null;
		for (int i = 0; i < columnNum; i++) {
			value = columns[i];
			if (isNumeric(value)) {
				if (value.contains(".")) {
					createCell(row, i, DoubleUtil.parseDouble(value), columnStyle);
				} else {
					createCell(row, i, IntegerUtil.parseInteger(value), columnStyle);
				}

			} else {
				createCell(row, i, value, columnStyle);
			}

		}
		rowNum++;
		if (rowNum >= 50001) {
			rowNum = 0;
			createSheet(sheetName);
			addHeaders(sheetheader);
		}
	}

	public void addColumns(Object[] columns) {
		HSSFRow row = sheets.getLast().createRow(rowNum);
		for (int i = 0; i < columnNum; i++) {
			createCell(row, i, columns[i], columnStyle);
		}
		rowNum++;
		if (rowNum >= 50001) {
			rowNum = 0;
			createSheet(sheetName);
			addHeaders(sheetheader);
		}
	}

	public void write(OutputStream stream) throws IOException {
		wb.write(stream);
	}

	protected HSSFCell createCell(HSSFRow row, int column, Object obj, CellStyle style) {
		if (obj instanceof Integer) {
			return createCell(row, column, (Integer) obj, style);
		} else if (obj instanceof Double) {
			return createCell(row, column, (Double) obj, style);
		} else if (obj instanceof Date) {
			return createCell(row, column, (Date) obj, style);
		} else {
			return createCell(row, column, (String) obj, style);
		}
	}

	protected HSSFCell createCell(HSSFRow row, int column, String value, CellStyle style) {
		HSSFCell cell = row.createCell(column);
		cell.setCellType(HSSFCell.CELL_TYPE_STRING);
		cell.setCellStyle(style);
		cell.setCellValue(value);
		return cell;
	}

	protected HSSFCell createCell(HSSFRow row, int column, Double value, CellStyle style) {
		HSSFCell cell = row.createCell(column);
		cell.setCellType(HSSFCell.CELL_TYPE_STRING);
		cell.setCellStyle(numStyle);
		cell.setCellValue(value);
		return cell;
	}

	protected HSSFCell createCell(HSSFRow row, int column, Integer value, CellStyle style) {
		HSSFCell cell = row.createCell(column);
		cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
		cell.setCellStyle(style);
		cell.setCellValue(value);
		return cell;
	}

	protected HSSFCell createCell(HSSFRow row, int column, Date date, CellStyle style) {
		HSSFCell cell = row.createCell(column);
		cell.setCellStyle(style);
		cell.setCellValue(DateUtil.format(date, "yyyy-MM-dd HH:mm:ss"));
		return cell;
	}

	private Font createFonts(HSSFWorkbook wb, short bold, String fontName, boolean isItalic, short hight) {
		Font font = wb.createFont();
		font.setFontName(fontName);
		font.setBoldweight(bold);
		font.setItalic(isItalic);
		font.setFontHeight(hight);
		return font;
	}

	Pattern pattern = Pattern.compile("^0|[1-9]\\d*(\\.\\d+)?$");

	private boolean isNumeric(String str) {
		if (str == null || "".equals(str.trim()) || str.length() > 11)
			return false;
		return pattern.matcher(str).matches();
	}

	// /*
	// *
	// * public static void main(String[] args) { FileOutputStream os; try { os
	// =
	// * new FileOutputStream("D:\\workbook.xls"); String header [] ={"建","值"};
	// *
	// * Excel e = new Excel(); HSSFWorkbook w = e.getWorkbook();
	// * e.createSheet("订单"); e.addHeaders(header);; for(int i =0;i<160000;i++)
	// {
	// * String cols [] ={"key"+i,"value"+i}; e.addColumns(cols); } w.write(os);
	// * os.close();
	// *
	// * } catch (FileNotFoundException e) {
	// * e.printStackTrace(); } catch (IOException e) {
	// * catch block e.printStackTrace(); }
	// *
	// * //wb.write(os);
	// *
	// * }
	// */

}
