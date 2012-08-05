package carddeckplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class RankingServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int rank;
		String id=req.getParameter("id");
		//rank MUST to be between 1-10
		rank=(Integer) req.getAttribute("rank");
		Key detailKey = KeyFactory.createKey("pluginDetails",id);
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		try {
			Entity entDetail=datastore.get(detailKey);
			entDetail.setProperty("Sum",(Integer)entDetail.getProperty("Sum")+rank);
			entDetail.setProperty("NumOfVotes",(Integer)entDetail.getProperty("NumOfVotes")+1);
			
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
