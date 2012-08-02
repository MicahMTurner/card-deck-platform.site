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
		System.out.println(pq.countEntities(FetchOptions.Builder.withLimit(100).offset(0)));
		List<Entity> entList = pq.asList(FetchOptions.Builder.withLimit(100).offset(0));
		
		query = new Query("pluginDetails");
		pq = datastore.prepare(query);
		List<Entity> detailList = pq.asList(FetchOptions.Builder.withLimit(100).offset(0));
		
		System.out.println("Keys:");
		if(entList!=null)
		for (Entity entity : entList) {
			for (String property : entity.getProperties().keySet()) {
				System.out.println(property);
			}
			
			Entity datastoreentity;
			Key detailKey = KeyFactory.createKey("pluginDetails",entity.getKey().getName());
			String detail=null;
			try {
				Entity entDetail=datastore.get(detailKey);
				detail=(String) entDetail.getProperty("Details");
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
			System.out.println(detail);
			System.out.println(entity.getProperty("filename"));
			System.out.println(entity.getProperty("creation"));
			System.out.println(entity.getKey().getName());
			plugins.add(new PluginDetails(detail, entity.getProperty("creation").toString(), "/serve?blob-key="+entity.getKey().getName()));
		}

		
		return plugins;
		
	} 
}
