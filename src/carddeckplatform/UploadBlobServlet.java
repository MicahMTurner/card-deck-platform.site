package carddeckplatform;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

public class UploadBlobServlet extends HttpServlet {
	private BlobstoreService blobstoreService = BlobstoreServiceFactory
			.getBlobstoreService();

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println(req.getParameter("Details"));
		// Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(req);
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
		List<BlobKey> blobKeys = blobs.get("Plugin");
		if (blobKeys != null)
			for (BlobKey blobKey : blobKeys) {
				if (blobKey == null) {
					res.sendRedirect("/");
				} else {
					res.sendRedirect("/serve?blob-key="
							+ blobKey.getKeyString());
					// res.getOutputStream().print(blobKey.get(0).getKeyString());
				}
			}
	}
}