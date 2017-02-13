package com.pro.bf.service;

import java.util.ArrayList;
import com.pro.bf.dto.AddrVO;

public interface AddrService {

	public ArrayList<AddrVO> getFindZipNum(String dong);
}
