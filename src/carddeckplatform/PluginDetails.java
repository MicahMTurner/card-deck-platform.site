package carddeckplatform;

public class PluginDetails {
	public String name;
	public String date;
	public String address;
	public PluginDetails(String name, String date, String address) {
		super();
		this.name = name;
		this.date = date;
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
