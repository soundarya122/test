package main.beans;

public class Topic {

	private int id;
	private String name;

	private int parentId;
	private String parent;
	private String link;

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public Topic(int id, String name, int parentId, String parent, String link) {
		super();
		this.id = id;
		this.parent = parent;
		this.name = name;
		this.parentId = parentId;
		this.link = link;
	}

}
