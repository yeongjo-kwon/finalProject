package com.it.apt.adminLiving.car.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CarServiceImpl implements CarService{
	@Autowired CarDAO carDao;

	@Override
	public int insertCar(CarVO vo) {
		return carDao.insertCar(vo);
	}

	@Override
	public List<CarVO> carListByCode(Map<String, Object> map) {
		return carDao.carListByCode(map);
	}

	@Override
	public List<Map<String, Object>> aptCarList(Map<String, Object> map) {
		return carDao.aptCarList(map);
	}

	@Override
	public List<Map<String, Object>> chartByAptNo(int aptNo) {
		return carDao.chartByAptNo(aptNo);
	}
	
}
