package com.karma_and_tumblbug.p1.sponsor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SponsorService {
	
	@Autowired
	private SponsorDAO sponsorDAO;
	
	public int setInsert(SponsorDTO sponsorDTO)throws Exception {
		return sponsorDAO.setInsert(sponsorDTO);
	}

	public SponsorDTO getSelect(SponsorDTO sponsorDTO) throws Exception{
		return sponsorDAO.getSelect(sponsorDTO);
	}
}
