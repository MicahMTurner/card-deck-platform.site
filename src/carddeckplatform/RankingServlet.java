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
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterPredicate;

public class RankingServlet extends HttpServlet{
	//to update u need to write for example: http://localhost:8888/rank?id=78da5d456205d7d8a6cdeb7cd6af0a51&rank=10
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		

		String rankStr=req.getParameter("rank");;
		int rank=Integer.parseInt(rankStr);
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		String id=req.getParameter("id");
		Query query= new Query("__BlobInfo__");
		query.setFilter( new FilterPredicate("md5_hash", Query.FilterOperator.EQUAL, req.getParameter("id")));
		
		PreparedQuery pq = datastore.prepare(query);
		for (Entity result : pq.asIterable()) {
			String blob=result.getKey().getName();
			//rank MUST to be between 1-10
			Key detailKey = KeyFactory.createKey("pluginDetails",blob);
			
			try {
				Entity entDetail=datastore.get(detailKey);
				long newNumOfVotes=(Long)entDetail.getProperty("NumOfVotes")+1;
				long newSum=(Long)entDetail.getProperty("Sum")+rank;
				entDetail.setProperty("Sum",newSum);
				entDetail.setProperty("NumOfVotes",newNumOfVotes);
				datastore.put(entDetail);
			} catch (EntityNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
		
		
	}

}




