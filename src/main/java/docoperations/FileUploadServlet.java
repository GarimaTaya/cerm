/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package docoperations;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "FileUploadServlet", urlPatterns = {"/upload"})
@MultipartConfig
public class FileUploadServlet extends HttpServlet
{
public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
{
    response.setContentType("text/html;charset=UTF-8");

    // Create path components to save the file
    //final String path = request.getParameter("destination");
    final String path = System.getProperty("user.dir") + "/uploads/";
    final Part filePart = request.getPart("file");
    final String fileName = getFileName(filePart);

    OutputStream out = null;
    InputStream filecontent = null;
    final PrintWriter writer = response.getWriter();

    ServletContext sc = this.getServletContext();
    RequestDispatcher rd = sc.getRequestDispatcher("/uploadfile.jsp");
    rd.include(request, response);

    try {
        out = new FileOutputStream(new File(path + File.separator  + fileName));
        filecontent = filePart.getInputStream();

        int read = 0;
        final byte[] bytes = new byte[1024];

        while ((read = filecontent.read(bytes)) != -1) {
            out.write(bytes, 0, read);
        }
        writer.println("<div style='margin-left:35%;color: white'>");
        writer.println("New file " + fileName + " created at " + path);
        writer.println("</div>");
        
    } catch (FileNotFoundException fne) {
        writer.println("<div style='margin-left:35%;color: white'>");
        writer.println("You either did not specify a file to upload or are "
                + "trying to upload a file to a protected or nonexistent "
                + "location.");
        writer.println("<br/> ERROR: " + fne.getMessage());
        writer.println("</div>");

        
    } finally {
        if (out != null) {
            out.close();
        }
        if (filecontent != null) {
            filecontent.close();
        }
        if (writer != null) {
            writer.close();
        }
    }
    
}

private String getFileName(final Part part)
 {
    final String partHeader = part.getHeader("content-disposition");
    
    for (String content : part.getHeader("content-disposition").split(";")) {
        if (content.trim().startsWith("filename")) {
            return content.substring(
                    content.indexOf('=') + 1).trim().replace("\"", "");
        }
    }
    return null;
}
}
