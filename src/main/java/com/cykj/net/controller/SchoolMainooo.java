//package com.cykj.net.controller;
//
////import org.apache.poi.hssf.extractor.ExcelExtractor;
////import org.apache.poi.hssf.usermodel.*;
////import org.apache.poi.poifs.filesystem.POIFSFileSystem;
////import org.apache.poi.ss.usermodel.*;
////import org.omg.CORBA.portable.InputStream;
//
//import java.io.InputStream;
//import java.io.FileInputStream;
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.util.Calendar;
//import java.util.Date;
//
//public class SchoolMainooo
//{
//	public static void main(String[] args) throws IOException
//	{
////		基本创建工作本
////		creat1();
////		获取当前时间
////		creat2();
////		遍历获取表格数据
////		creat3();
////		遍历获取表格数据
////		creat4();
//
//		creat5();
//	}
//
//	/**
//	 * 基本
//	 * @throws IOException
//	 */
//	public static void creat1() throws IOException
//	{
//		//new一个工作本
//		Workbook wb=new HSSFWorkbook();
//		//创建sheet页
//		Sheet sheet1=wb.createSheet("第一个sheet页");
//		Sheet sheet2=wb.createSheet("第二个sheet页");
//		//创建一个行
//		Row row=sheet1.createRow(0);
//		//创建一个单元格
//		Cell cell=row.createCell(0);
//		//给单元格赋值
//		cell.setCellValue(1);
//		//创建一个单元格，第二列值1.2
//		row.createCell(1).setCellValue(1.2);
//		//创建一个单元格，第三列值String类型
//		row.createCell(2).setCellValue("这是一个字符串");
//		//创建一个单元格，第四列值boolean类型
//		row.createCell(3).setCellValue(false);
//		//输出流
//		FileOutputStream fileOut=new FileOutputStream("G:\\工作本.xls");
//		//打印流
//		wb.write(fileOut);
//		//关闭流
//		fileOut.close();
//	}
//
//	/**
//	 * 获取当前时间方式
//	 * @throws IOException
//	 */
//	public static void creat2() throws IOException
//	{
//		//new一个工作本
//		Workbook wb=new HSSFWorkbook();
//		//创建sheet页
//		Sheet sheet1=wb.createSheet("第一个sheet页");
//		//创建一个行
//		Row row=sheet1.createRow(0);
//		//创建一个单元格,第一列
//		Cell cell=row.createCell(0);
//		cell.setCellValue(new Date());
//
//		//创建一个单元格,第二列
//		cell=row.createCell(1);
//		CreationHelper creationHelper=wb.getCreationHelper();
//		//单元格样式
//		CellStyle cellStyle=wb.createCellStyle();
//		cellStyle.setDataFormat(creationHelper.createDataFormat().getFormat("yyy-mm-dd hh:mm:ss"));
//		//给单元格赋值,时间
//		cell.setCellValue(new Date());
//		cell.setCellStyle(cellStyle);
//
//		//创建一个单元格,第三列
//		cell=row.createCell(2);
//		cell.setCellValue(Calendar.getInstance());
//		cell.setCellStyle(cellStyle);
//
//
//		//输出流
//		FileOutputStream fileOut=new FileOutputStream("G:\\工作本.xls");
//		//打印流
//		wb.write(fileOut);
//		//关闭流
//		fileOut.close();
//	}
//	public static void creat3() throws IOException
//	{
//		InputStream is= new FileInputStream("G:\\二货名单.xls");
//		POIFSFileSystem fs=new POIFSFileSystem(is);
//		HSSFWorkbook wb=new HSSFWorkbook(fs);
//		//获取第一个sheet页
//		HSSFSheet hssfSheet=wb.getSheetAt(0);
//		if(hssfSheet==null){
//			return;
//		}
//		//遍历ROW
//		for (int rowNum = 0; rowNum <hssfSheet.getLastRowNum()+1 ; rowNum++)
//		{
//			HSSFRow hssfRow=hssfSheet.getRow(rowNum);
//			if(hssfRow==null){
//				continue;
//			}
//			//遍历cell
//			for (int cellNum = 0; cellNum <hssfRow.getLastCellNum() ; cellNum++)
//			{
//				HSSFCell hssfCell=hssfRow.getCell(cellNum);
//				if(hssfCell==null){
//					continue;
//				}
//				System.out.print(" "+getvalue(hssfCell));
//			}
//			System.out.println();
//		}
//
//
//	}
//	public static void creat4() throws IOException
//	{
//		InputStream is= new FileInputStream("G:\\二货名单.xls");
//		POIFSFileSystem fs=new POIFSFileSystem(is);
//		HSSFWorkbook wb=new HSSFWorkbook(fs);
//		ExcelExtractor excelExtractor=new ExcelExtractor(wb);
//		//不需要sheet页名字
//		excelExtractor.setIncludeSheetNames(false);
//		System.out.println(excelExtractor.getText());
//	}
//
//	public static void creat5() throws IOException{
//		//new一个工作本
//		Workbook wb=new HSSFWorkbook();
//		//创建sheet页
//		Sheet sheet1=wb.createSheet("第一个sheet页");
//		//创建一个行
//		Row row=sheet1.createRow(2);
//		//设置高度
////		row.setHeightInPoints(30);
//		createCell(wb, row, (short) 1,"你好");
//		//输出流
//		FileOutputStream fileOut=new FileOutputStream("G:\\工作本.xls");
//		//打印流
//		wb.write(fileOut);
//		//关闭流
//		fileOut.close();
//	}
//
//	//返回类型
//	public static String getvalue(HSSFCell hssfCell){
//		if(hssfCell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
//			return String.valueOf(hssfCell.getBooleanCellValue());
//		}else if(hssfCell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
//			return String.valueOf(hssfCell.getNumericCellValue());
//		}else{
//			return String.valueOf(hssfCell.getStringCellValue());
//		}
//	}
//
//
//	private static void createCell(Workbook wb,Row row,short column,String value){
//		//创建单元格
//		Cell cell=row.createCell(column);
//		//设置值
//		cell.setCellValue(new HSSFRichTextString(value));
//		//创建单元格样式
//		CellStyle cellStyle=wb.createCellStyle();
//		//设置单元格水平方式对齐方式
//		cellStyle.setAlignment(HorizontalAlignment.CENTER);
//		//设置单元格样式
//		cell.setCellStyle(cellStyle);
//	}
//}
//
//
