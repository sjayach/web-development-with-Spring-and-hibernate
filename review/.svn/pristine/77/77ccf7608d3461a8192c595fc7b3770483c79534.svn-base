package cs520.review.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Download")
public class Download extends javax.servlet.http.HttpServlet implements
    javax.servlet.Servlet {

    private static final long serialVersionUID = 1L;

    public Download()
    {
        super();
    }

    protected void doGet( HttpServletRequest request,
        HttpServletResponse response ) throws ServletException, IOException
    {
        // read the file, write it out to response
        String path = getServletContext().getRealPath( "/WEB-INF/chair.jpg" );

        response.setContentType( "image/jpeg" );
        response
            .setHeader( "Content-disposition", "inline; filename=chair.jpg" );

        FileInputStream in = new FileInputStream( path );
        OutputStream out = response.getOutputStream();
        byte[] buffer = new byte[2048];
        int bytesRead;
        while( (bytesRead = in.read( buffer )) > 0 )
            out.write( buffer, 0, bytesRead );
        in.close();
    }

    protected void doPost( HttpServletRequest request,
        HttpServletResponse response ) throws ServletException, IOException
    {
        doGet( request, response );
    }

}
