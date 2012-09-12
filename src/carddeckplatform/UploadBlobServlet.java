package carddeckplatform;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.FetchOptions;



public class UploadBlobServlet extends HttpServlet {
	
	
	private BlobstoreService blobstoreService = BlobstoreServiceFactory
			.getBlobstoreService();
	private DatastoreService datastoreService = DatastoreServiceFactory
			.getDatastoreService();
	
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		// Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(req);
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
		
		List<BlobKey> blobKeys = blobs.get("Plugin");
		if (blobKeys != null)
			for (BlobKey blobKey : blobKeys) {
				if (blobKey == null) {
					res.sendRedirect("/");
				} else {
					// res.sendRedirect("/serve?blob-key="
					// + blobKey.getKeyString());

					if (isFileAlreadyExist(blobKey)) {
						blobstoreService.delete(blobKey);
												
					} else {

						// storing the details at datastore
						Entity pluginDetail = new Entity("pluginDetails",
								blobKey.getKeyString());
						pluginDetail.setProperty("Details",
								req.getParameter("Details"));
						pluginDetail.setProperty("Sum", 5);
						pluginDetail.setProperty("NumOfVotes", 1);

						datastoreService.put(pluginDetail);

						// response
						System.out.println("blobKey:" + blobKey.getKeyString());
						PrintWriter out = res.getWriter();
						res.setContentType("text/html");
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Upload Succesed');");
						out.println("</script>");
						
					}
					res.sendRedirect("/plugins.jsp");
				}
			}
	}

	private boolean isFileAlreadyExist(BlobKey blobKey) {
		Key key = KeyFactory.createKey("__BlobInfo__",blobKey.getKeyString());
		try {
			System.out.println("the Key:"+key);
			String md5=(String) datastoreService.get(key).getProperty("md5_hash");
			
			Query query= new Query("__BlobInfo__");
			query.setFilter(new FilterPredicate("md5_hash", Query.FilterOperator.EQUAL, md5));
			PreparedQuery pq = datastoreService.prepare(query);
			List<Entity> entities=pq.asList(FetchOptions.Builder.withDefaults());
			if(entities.size()>1)
				return true;
			return false;
			
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
}