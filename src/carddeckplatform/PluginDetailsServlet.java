package carddeckplatform;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.gson.Gson;

@SuppressWarnings("serial")
public class PluginDetailsServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse response)
			throws ServletException, IOException {
		List<PluginDetails> products = DataBaseManager.getPlugins();
	    String json = new Gson().toJson(products);

	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
	}
	
}
