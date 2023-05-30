package com.neu.edu.cardhop.controller;

import java.awt.Color;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.neu.edu.cardhop.pojo.User;

public class PDFView extends AbstractPdfView{
	@Override
    protected void buildPdfDocument(Map<String, Object>map, Document doc,
            PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
		Map<String, Object> userData = (Map<String, Object>) map.get("userData");
		User u = (User) userData.get("user");
		
		Font helvetica_bolditalic_25 = new Font(Font.HELVETICA,25,Font.BOLDITALIC,Color.blue);
		Font times_normal_black_16 = new Font(Font.TIMES_ROMAN,16,Font.NORMAL, Color.black);
		Font times_bold_pink_20 = new Font(Font.TIMES_ROMAN,20,Font.BOLD, Color.pink);
		
		doc.add(new Paragraph("My Information",helvetica_bolditalic_25));
		
		PdfPTable table1 = new PdfPTable(2);
		table1.setSpacingBefore(20);
		table1.setWidthPercentage(100.0f);
		table1.setWidths(new float[] {4.0f,6.0f});

		table1.addCell(new PdfPCell(new Phrase("Name : "+u.getName(),times_bold_pink_20)));
		table1.addCell(new PdfPCell(new Phrase("Phone No. : "+u.getPhone(),times_normal_black_16)));
		table1.addCell(new PdfPCell(new Phrase("Email : "+u.getEmail(),times_normal_black_16)));
		table1.addCell(new PdfPCell(new Phrase("Address : "+u.getAddress(),times_normal_black_16)));
		table1.addCell(new PdfPCell(new Phrase("Login Name : "+u.getLoginName(),times_normal_black_16)));
        
		doc.add(table1);
		
		
	}
}
