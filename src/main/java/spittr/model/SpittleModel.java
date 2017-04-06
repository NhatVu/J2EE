package spittr.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class SpittleModel {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="spitter")
	private SpitterModel spitter;
	
	@Column
	private String message;
	
	@Column
	private Date postedTime;

	public SpittleModel() {}

	public SpittleModel(Long id, SpitterModel spitter, String message, Date postedTime) {
		this.id = id;
		this.spitter = spitter;
		this.message = message;
		this.postedTime = postedTime;
	}

	public Long getId() {
		return this.id;
	}

	public String getMessage() {
		return this.message;
	}

	public Date getPostedTime() {
		return this.postedTime;
	}

	public SpitterModel getSpitter() {
		return this.spitter;
	}

}
