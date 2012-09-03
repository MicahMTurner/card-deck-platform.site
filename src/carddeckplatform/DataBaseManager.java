package carddeckplatform;

import java.util.ArrayList;
import java.util.List;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

public class DataBaseManager {
	
	
	static public List<PluginDetails> getPlugins(){
		List<PluginDetails> plugins= new ArrayList<PluginDetails>();
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		Query query = new Query("__BlobInfo__");
		PreparedQuery pq = datastore.prepare(query);
		List<Entity> entList = pq.asList(FetchOptions.Builder.withLimit(100).offset(0));
		
		query = new Query("pluginDetails");
		pq = datastore.prepare(query);
		List<Entity> detailList = pq.asList(FetchOptions.Builder.withLimit(100).offset(0));
		
		if(entList!=null)
		for (Entity entity : entList) {
			Entity datastoreentity;
			Key detailKey = KeyFactory.createKey("pluginDetails",entity.getKey().getName());
			String detail=null;
			Long numOfVotes=(long) 0;
			Long sum=(long) 0;
			try {
				Entity entDetail=datastore.get(detailKey);
				detail=(String) entDetail.getProperty("Details");
				sum=(Long) entDetail.getProperty("Sum");
				numOfVotes=(Long) entDetail.getProperty("NumOfVotes");
			} catch (EntityNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
//			String details=null;
//			try {
//				datastoreentity = datastore.get(entity.getKey());
//				details=(String) datastoreentity.getProperty("pluginDetails");
//			} catch (EntityNotFoundException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			Long size=(Long)entity.getProperty("size");
			String filename=(String) entity.getProperty("filename");
			plugins.add(new PluginDetails(detail, entity.getProperty("creation").toString(), "/serve?blob-key="+entity.getKey().getName(), sum, numOfVotes,size,filename));
			
		}

		
		return plugins;
		
	} 
}
