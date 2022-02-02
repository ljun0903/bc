package bit.your.prj.service;

import java.util.List;

import bit.your.prj.dto.CartDto;
import bit.your.prj.dto.IncomeDto;
import bit.your.prj.dto.MarketDto;
import bit.your.prj.dto.MarketParam;
import bit.your.prj.dto.ReviewDto;

public interface MarketService {

	List<MarketDto> getMarketlist();
	
	List<MarketDto> bestmarketlist();
	
	MarketDto getMarket(int seq);
	
	MarketDto getMarket2(int itemnum);
	
	public List<MarketDto> getCalist(int canum);
	
	boolean uploadMarket(MarketDto dto);
	
	MarketDto getItem(int itemnum);
	
	boolean addCart(CartDto dto);
	
	int getCartCount(String id);
	
	List<MarketDto> newMarketList();
	
	List<MarketDto> getSearchList(MarketParam search);
	
	List<CartDto> getCartList(String id);
	
	CartDto getCount(int itemnum);
	
	boolean delCart(int seq);
	
	boolean itemCountUp(int seq);
	
	boolean itemCountDown(int seq);
	
	boolean delAllItem(String id);
	
	CartDto getCartItem(int seq);
	
	boolean insertIncome(IncomeDto dto);
	
	List<IncomeDto> getIncome(String id);
	
	boolean insertReview(ReviewDto dto);
	
	List<ReviewDto> getReview(int itemnum);
	
	boolean UpReviewCount(int itemnum);
	
	List<ReviewDto> getReviewList(String nickname);
	
}
