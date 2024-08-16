package helper;
import java.io.FileOutputStream;
import java.io.InputStream;


public class Helper {

    public static boolean saveFile(InputStream inputStream, String path) {
        boolean f = false;
        try {
        	
        	
            byte[] buffer = new byte[inputStream.available()];
            
            inputStream.read(buffer);
            
            FileOutputStream fos=new FileOutputStream(path);
            
            fos.write(buffer);
            fos.flush();
            fos.close();
            
            f=true;
        
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    
    

}
