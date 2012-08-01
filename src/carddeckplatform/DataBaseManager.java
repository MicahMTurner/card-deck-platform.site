package carddeckplatform;

import java.util.ArrayList;
import java.util.List;

public class DataBaseManager {
	
	
	static public List<PluginDetails> getPlugins(){
		List<PluginDetails> plugins= new ArrayList<PluginDetails>();
		plugins.add(new PluginDetails("a", "1", "1"));
		plugins.add(new PluginDetails("b", "2", "2"));
		plugins.add(new PluginDetails("c", "3", "3"));
		plugins.add(new PluginDetails("d", "4", "4"));
		return plugins;
		
	} 
}
