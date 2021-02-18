package com.it.apt.adminLiving.car.model;

import java.util.List;
import java.util.Map;

public interface CarService {
	int insertCar(CarVO vo);
	List<CarVO> carListByCode(Map<String, Object> map);
	List<Map<String, Object>> aptCarList(Map<String, Object> map);
	List<Map<String, Object>> chartByAptNo(int aptNo);

}
