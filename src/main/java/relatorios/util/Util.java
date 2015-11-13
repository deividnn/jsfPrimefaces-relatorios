/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package relatorios.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;
import javax.servlet.ServletContext;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;

/**
 *
 * @author Deivid
 */
@ManagedBean
public class Util {

    public DefaultStreamedContent pdf = new DefaultStreamedContent();
    public long nomeArquivo;

    public void GerarPDFBean(String arquivoJasper, String arquivoPdf) {

        this.nomeArquivo = new Date().getTime();

        Connection conexao = pegarConexao();
        ByteArrayOutputStream relat = new ByteArrayOutputStream();
        InputStream relatorio = null;

        ServletContext servletContext = (ServletContext) FacesContext.
                getCurrentInstance().getExternalContext().getContext();
        String absoluteDiskPath = servletContext.getRealPath("/resources/relatorio/");
        File targetFolder = new File(absoluteDiskPath);

        String absoluteDiskPath2 = servletContext.getRealPath("/resources/arquivos/");
        File targetFolder2 = new File(absoluteDiskPath2);

        try {

            InputStream input = new FileInputStream(new File(targetFolder + File.separator + arquivoJasper + ".jasper"));
            JasperPrint print = JasperFillManager.fillReport(input, null, conexao);
            JasperExportManager.exportReportToPdfStream(print, relat);
            relatorio = new ByteArrayInputStream(relat.toByteArray());

        } catch (JRException | FileNotFoundException e) {
            throw new RuntimeException("It's not possible to generate the pdf report.", e);
        } finally {
            try {
                if (conexao != null) {
                    conexao.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.pdf = new DefaultStreamedContent(relatorio, "application/pdf", arquivoPdf + ".pdf");
        OutputStream out = null;
        try {
            out = new FileOutputStream(new File(targetFolder2, this.nomeArquivo + ".pdf"));
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
        }
        int read = 0;
        byte[] bytes = new byte[1024];
        try {
            while ((read = this.pdf.getStream().read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
        } catch (IOException ex) {
            Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            out.flush();
        } catch (IOException ex) {
            Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            out.close();
        } catch (IOException ex) {
            Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public StreamedContent GerarPDFBeanSalvar(String arquivoJasper, String arquivoPdf) {

        Connection conexao = pegarConexao();
        ByteArrayOutputStream relat = new ByteArrayOutputStream();
        InputStream relatorio = null;

        ServletContext servletContext = (ServletContext) FacesContext.
                getCurrentInstance().getExternalContext().getContext();
        String absoluteDiskPath = servletContext.getRealPath("/resources/relatorio/");
        File targetFolder = new File(absoluteDiskPath);

        try {

            InputStream input = new FileInputStream(new File(targetFolder + File.separator + arquivoJasper + ".jasper"));
            JasperPrint print = JasperFillManager.fillReport(input, null, conexao);
            JasperExportManager.exportReportToPdfStream(print, relat);
            relatorio = new ByteArrayInputStream(relat.toByteArray());

        } catch (JRException | FileNotFoundException e) {
            throw new RuntimeException("It's not possible to generate the pdf report.", e);
        } finally {
            try {
                if (conexao != null) {
                    conexao.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.pdf = new DefaultStreamedContent(relatorio, "application/pdf", arquivoPdf + ".pdf");
        return this.pdf;
    }

    public Connection pegarConexao() {

        Connection conexao = null;

        try {
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
            }
            conexao = DriverManager.getConnection("jdbc:postgresql://localhost:5432/relatorios",
                    "deivid",
                    "deivid");
        } catch (SQLException ex) {
            Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conexao;
    }

    public DefaultStreamedContent getPdf() {
        return pdf;
    }

    public void setPdf(DefaultStreamedContent pdf) {
        this.pdf = pdf;
    }

    public long getNomeArquivo() {
        return nomeArquivo;
    }

    public void setNomeArquivo(long nomeArquivo) {
        this.nomeArquivo = nomeArquivo;
    }

}
