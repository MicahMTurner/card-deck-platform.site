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

public class UploadBlobServlet extends HttpServlet {
	private BlobstoreService blobstoreService = BlobstoreServiceFactory
			.getBlobstoreService();

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		// Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(req);
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		List<BlobKey> blobKeys = blobs.get("Plugin");
		if (blobKeys != null)
			for (BlobKey blobKey : blobKeys) {
				if (blobKey == null) {
					res.sendRedirect("/");
				} else {
					// res.sendRedirect("/serve?blob-key="
					// + blobKey.getKeyString());
					
					//storing the details at datastore
					Entity pluginDetail = new Entity("pluginDetails", blobKey.getKeyString());
					pluginDetail.setProperty("Details", req.getParameter("Details"));
					pluginDetail.setProperty("Sum", 5);
					pluginDetail.setProperty("NumOfVotes",1);
					
					datastore.put(pluginDetail);

					//response
					System.out.println("blobKey:"+blobKey.getKeyString());
					PrintWriter out = res.getWriter();
					res.setContentType("text/html");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Upload Succesed');");
					out.println("</script>");
					res.sendRedirect("/");
				}
			}
	}
}