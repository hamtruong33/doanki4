package com.demo.entities;
// Generated Nov 2, 2018 11:27:01 PM by Hibernate Tools 5.2.10.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

/**
 * Product generated by hbm2java
 */
@Entity
@Table(name = "product", catalog = "multivendor")
public class Product implements java.io.Serializable {

	private Integer id;
	private Category category;
	private Producer producer;
	
	private Shop shop;
	@NotEmpty
	private String name;
	@NotNull
	@Min(value = 0)
	private double price;
	private String description;
	private boolean status;
	private int accountid;
	private Double discount;
	@NotNull
	@Min(value = 0)
	private Integer quantity;
	//@Temporal(TemporalType.DATE)
	private Date dateCreated;
	private boolean isnew;
	private Set<Orderdetail> orderdetails = new HashSet<Orderdetail>(0);
	private Set<Review> reviews = new HashSet<Review>(0);
	private Set<Photo> photos = new HashSet<Photo>(0);

	public Product(Integer id, Category category, Producer producer, Shop shop, String name, double price, String description, boolean status, int accountid, Double discount, Integer quantity, Date dateCreated, boolean isnew, Set<Orderdetail> orderdetails, Set<Review> reviews, Set<Photo> photos) {
		this.id = id;
		this.category = category;
		this.producer = producer;
		this.shop = shop;
		this.name = name;
		this.price = price;
		this.description = description;
		this.status = status;
		this.accountid = accountid;
		this.discount = discount;
		this.quantity = quantity;
		this.dateCreated = dateCreated;
		this.isnew = isnew;
		this.orderdetails = orderdetails;
		this.reviews = reviews;
		this.photos = photos;
	}


	public Product() {
	}

	public Product(Producer producer, Shop shop, String name, double price, boolean status, int accountid) {
		this.producer = producer;
		this.shop = shop;
		this.name = name;
		this.price = price;
		this.status = status;
		this.accountid = accountid;
	}

	public Product(Category category, Producer producer, Shop shop, String name, double price, String description,
			boolean status, int accountid, Double discount, Integer quantity, Date dateCreated,
			Set<Orderdetail> orderdetails, Set<Review> reviews, Set<Photo> photos) {
		this.category = category;
		this.producer = producer;
		this.shop = shop;
		this.name = name;
		this.price = price;
		this.description = description;
		this.status = status;
		this.accountid = accountid;
		this.discount = discount;
		this.quantity = quantity;
		this.dateCreated = dateCreated;
		this.orderdetails = orderdetails;
		this.reviews = reviews;
		this.photos = photos;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "categoryid")
	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "producerid", nullable = false)
	public Producer getProducer() {
		return this.producer;
	}

	public void setProducer(Producer producer) {
		this.producer = producer;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "shopid", nullable = false)
	public Shop getShop() {
		return this.shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	@Column(name = "name", nullable = false, length = 250)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "price", nullable = false, precision = 22, scale = 0)
	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Column(name = "description", length = 250)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Column(name = "accountid", nullable = false)
	public int getAccountid() {
		return this.accountid;
	}

	public void setAccountid(int accountid) {
		this.accountid = accountid;
	}

	@Column(name = "discount", precision = 22, scale = 0)
	public Double getDiscount() {
		return this.discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	@Column(name = "quantity")
	public Integer getQuantity() {
		return this.quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "date_Created", length = 10)
	public Date getDateCreated() {
		return this.dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Orderdetail> getOrderdetails() {
		return this.orderdetails;
	}

	public void setOrderdetails(Set<Orderdetail> orderdetails) {
		this.orderdetails = orderdetails;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Review> getReviews() {
		return this.reviews;
	}

	public void setReviews(Set<Review> reviews) {
		this.reviews = reviews;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Photo> getPhotos() {
		return this.photos;
	}

	public void setPhotos(Set<Photo> photos) {
		this.photos = photos;
	}


    /**
     * @return boolean return the isnew
     */
    public boolean isIsnew() {
        return isnew;
    }

    /**
     * @param isnew the isnew to set
     */
    public void setIsnew(boolean isnew) {
        this.isnew = isnew;
    }

}
