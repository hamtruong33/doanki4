package com.demo.schedule;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.demo.entities.Shop;
import com.demo.services.ShopService;
@Component
public class ShopSchedule {
	
	private static final DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss sss");
	
	@Autowired
	private ShopService shopService;
	//@Scheduled(cron="0 0 0 * * *",zone="Asia/Saigon")
	@Scheduled(cron="*/10 * * * * *" ,zone="Asia/Saigon")
	//@Scheduled(fixedDelay = 2 * 1000)
	public void checkmembership() {
//		Date now = new Date();
//
//		String nowString = df.format(now);
//
//		System.out.println("Now is: " + nowString);
		List<Shop> shops = shopService.findAll();
		for (Shop shop : shops) {
			if (shop.getDateEnd().before(new Date())) {
				shop.setStatus(false);
				shopService.save(shop);
			}else {
				shop.setStatus(true);
				shopService.save(shop);
			}
		}
	}

}
