package util;

import jakarta.servlet.http.HttpServletRequest;
import lombok.NoArgsConstructor;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.IOException;

public class JSONBodyMethod {

    public static JSONObject readJSONBody(HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("UTF-8");
        BufferedReader reader = request.getReader();
        String line;
        StringBuffer content = new StringBuffer();
        while ((line = reader.readLine()) != null) {
            content.append(line);
        }
        reader.close();
        return new JSONObject(content.toString());
    }
}
